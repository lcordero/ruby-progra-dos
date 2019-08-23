# frozen_string_literal: true

module Capybara
  module Queries
    class SelectorQuery < Queries::BaseQuery
      attr_reader :expression, :selector, :locator, :options
      VALID_KEYS = COUNT_KEYS +
                   %i[text id class style visible obscured exact exact_text normalize_ws match wait filter_set]
      VALID_MATCH = %i[first smart prefer_exact one].freeze

      def initialize(*args,
                     session_options:,
                     enable_aria_label: session_options.enable_aria_label,
                     test_id: session_options.test_id,
                     selector_format: nil,
                     **options,
                     &filter_block)
        @resolved_node = nil
        @resolved_count = 0
        @options = options.dup
        super(@options)
        self.session_options = session_options

        @selector = Selector.new(
          find_selector(args[0].is_a?(Symbol) ? args.shift : args[0]),
          config: { enable_aria_label: enable_aria_label, test_id: test_id },
          format: selector_format
        )

        @locator = args.shift
        @filter_block = filter_block

        raise ArgumentError, "Unused parameters passed to #{self.class.name} : #{args}" unless args.empty?

        @expression = selector.call(@locator, @options)

        warn_exact_usage

        assert_valid_keys
      end

      def name; selector.name; end
      def label; selector.label || selector.name; end

      def description(only_applied = false)
        desc = +''
        show_for = show_for_stage(only_applied)

        if show_for[:any]
          desc << 'visible ' if visible == :visible
          desc << 'non-visible ' if visible == :hidden
        end
        desc << "#{label} #{locator.inspect}"
        if show_for[:any]
          desc << " with#{' exact' if exact_text == true} text #{options[:text].inspect}" if options[:text]
          desc << " with exact text #{exact_text}" if exact_text.is_a?(String)
        end
        desc << " with id #{options[:id]}" if options[:id]
        desc << " with classes [#{Array(options[:class]).join(',')}]" if options[:class]
        desc << case options[:style]
        when String
          " with style attribute #{options[:style].inspect}"
        when Regexp
          " with style attribute matching #{options[:style].inspect}"
        when Hash
          " with styles #{options[:style].inspect}"
        else ''
        end
        desc << selector.description(node_filters: show_for[:node], **options)
        desc << ' that also matches the custom filter block' if @filter_block && show_for[:node]
        desc << " within #{@resolved_node.inspect}" if describe_within?
        if locator.is_a?(String) && locator.start_with?('#', './/', '//')
          unless selector.raw_locator?
            desc << "\nNote: It appears you may be passing a CSS selector or XPath expression rather than a locator. " \
                    "Please see the documentation for acceptable locator values.\n\n"
          end
        end
        desc
      end

      def applied_description
        description(true)
      end

      def matches_filters?(node, node_filter_errors = [])
        return true if (@resolved_node&.== node) && options[:allow_self]

        matches_locator_filter?(node) &&
          matches_system_filters?(node) &&
          matches_node_filters?(node, node_filter_errors) &&
          matches_filter_block?(node)
      rescue *(node.respond_to?(:session) ? node.session.driver.invalid_element_errors : [])
        false
      end

      def visible
        case (vis = options.fetch(:visible) { default_visibility })
        when true then :visible
        when false then :all
        else vis
        end
      end

      def exact?
        supports_exact? ? options.fetch(:exact, session_options.exact) : false
      end

      def match
        options.fetch(:match, session_options.match)
      end

      def xpath(exact = nil)
        exact = exact? if exact.nil?
        expr = apply_expression_filters(@expression)
        expr = exact ? expr.to_xpath(:exact) : expr.to_s if expr.respond_to?(:to_xpath)
        expr = filtered_expression(expr)
        expr = "(#{expr})[#{xpath_text_conditions}]" if try_text_match_in_expression?
        expr
      end

      def css
        filtered_expression(apply_expression_filters(@expression))
      end

      # @api private
      def resolve_for(node, exact = nil)
        applied_filters.clear
        @resolved_node = node
        @resolved_count += 1
        node.synchronize do
          children = find_nodes_by_selector_format(node, exact).map(&method(:to_element))
          Capybara::Result.new(children, self)
        end
      end

      # @api private
      def supports_exact?
        return @expression.respond_to? :to_xpath if @selector.supports_exact?.nil?

        @selector.supports_exact?
      end

      def failure_message
        +"expected to find #{applied_description}" << count_message
      end

      def negative_failure_message
        +"expected not to find #{applied_description}" << count_message
      end

    private

      def selector_format
        @selector.format
      end

      def matching_text
        options[:text] || options[:exact_text]
      end

      def text_fragments
        (text = matching_text).is_a?(String) ? text.split : []
      end

      def xpath_text_conditions
        case (text = matching_text)
        when String
          text.split.map { |txt| XPath.contains(txt) }.reduce(&:&)
        when Regexp
          condition = XPath.current
          condition = condition.uppercase if text.casefold?
          Selector::RegexpDisassembler.new(text).alternated_substrings.map do |strs|
            strs.flat_map(&:split).map { |str| condition.contains(str) }.reduce(:&)
          end.reduce(:|)
        end
      end

      def try_text_match_in_expression?
        first_try? &&
          matching_text &&
          @resolved_node.is_a?(Capybara::Node::Base) &&
          @resolved_node.session&.driver&.wait?
      end

      def first_try?
        @resolved_count == 1
      end

      def show_for_stage(only_applied)
        lambda do |stage = :any|
          !only_applied || (stage == :any ? applied_filters.any? : applied_filters.include?(stage))
        end
      end

      def applied_filters
        @applied_filters ||= []
      end

      def find_selector(locator)
        case locator
        when Symbol then Selector[locator]
        else Selector.for(locator)
        end || Selector[session_options.default_selector]
      end

      def find_nodes_by_selector_format(node, exact)
        hints = {}
        hints[:uses_visibility] = true unless visible == :all
        hints[:texts] = text_fragments unless selector_format == :xpath
        hints[:styles] = options[:style] if use_default_style_filter?

        if selector_format == :css
          if node.method(:find_css).arity != 1
            node.find_css(css, **hints)
          else
            node.find_css(css)
          end
        elsif selector_format == :xpath
          if node.method(:find_xpath).arity != 1
            node.find_xpath(xpath(exact), **hints)
          else
            node.find_xpath(xpath(exact))
          end
        else
          raise ArgumentError, "Unknown format: #{selector_format}"
        end
      end

      def to_element(node)
        if @resolved_node.is_a?(Capybara::Node::Base)
          Capybara::Node::Element.new(@resolved_node.session, node, @resolved_node, self)
        else
          Capybara::Node::Simple.new(node)
        end
      end

      def valid_keys
        VALID_KEYS + custom_keys
      end

      def matches_node_filters?(node, errors)
        applied_filters << :node

        unapplied_options = options.keys - valid_keys
        @selector.with_filter_errors(errors) do
          node_filters.all? do |filter_name, filter|
            next true unless apply_filter?(filter)

            if filter.matcher?
              unapplied_options.select { |option_name| filter.handles_option?(option_name) }.all? do |option_name|
                unapplied_options.delete(option_name)
                filter.matches?(node, option_name, options[option_name], @selector)
              end
            elsif options.key?(filter_name)
              unapplied_options.delete(filter_name)
              filter.matches?(node, filter_name, options[filter_name], @selector)
            elsif filter.default?
              filter.matches?(node, filter_name, filter.default, @selector)
            else
              true
            end
          end
        end
      end

      def matches_filter_block?(node)
        return true unless @filter_block

        if node.respond_to?(:session)
          node.session.using_wait_time(0) { @filter_block.call(node) }
        else
          @filter_block.call(node)
        end
      end

      def filter_set(name)
        ::Capybara::Selector::FilterSet[name]
      end

      def node_filters
        if options.key?(:filter_set)
          filter_set(options[:filter_set])
        else
          @selector
        end.node_filters
      end

      def expression_filters
        filters = @selector.expression_filters
        filters.merge filter_set(options[:filter_set]).expression_filters if options.key?(:filter_set)
        filters
      end

      def custom_keys
        @custom_keys ||= node_filters.keys + expression_filters.keys
      end

      def assert_valid_keys
        unless VALID_MATCH.include?(match)
          raise ArgumentError, "Invalid option #{match.inspect} for :match, should be one of #{VALID_MATCH.map(&:inspect).join(', ')}"
        end

        unhandled_options = @options.keys.reject do |option_name|
          valid_keys.include?(option_name) ||
            expression_filters.any? { |_name, ef| ef.handles_option? option_name } ||
            node_filters.any? { |_name, nf| nf.handles_option? option_name }
        end

        return if unhandled_options.empty?

        invalid_names = unhandled_options.map(&:inspect).join(', ')
        valid_names = (valid_keys - [:allow_self]).map(&:inspect).join(', ')
        raise ArgumentError, "Invalid option(s) #{invalid_names}, should be one of #{valid_names}"
      end

      def filtered_expression(expr)
        conditions = {}
        conditions[:id] = options[:id] if use_default_id_filter?
        conditions[:class] = options[:class] if use_default_class_filter?
        conditions[:style] = options[:style] if use_default_style_filter? && !options[:style].is_a?(Hash)
        builder(expr).add_attribute_conditions(conditions)
      end

      def use_default_id_filter?
        options.key?(:id) && !custom_keys.include?(:id)
      end

      def use_default_class_filter?
        options.key?(:class) && !custom_keys.include?(:class)
      end

      def use_default_style_filter?
        options.key?(:style) && !custom_keys.include?(:style)
      end

      def apply_expression_filters(expression)
        unapplied_options = options.keys - valid_keys
        expression_filters.inject(expression) do |expr, (name, ef)|
          next expr unless apply_filter?(ef)

          if ef.matcher?
            unapplied_options.select(&ef.method(:handles_option?)).inject(expr) do |memo, option_name|
              unapplied_options.delete(option_name)
              ef.apply_filter(memo, option_name, options[option_name], @selector)
            end
          elsif options.key?(name)
            unapplied_options.delete(name)
            ef.apply_filter(expr, name, options[name], @selector)
          elsif ef.default?
            ef.apply_filter(expr, name, ef.default, @selector)
          else
            expr
          end
        end
      end

      def warn_exact_usage
        return unless options.key?(:exact) && !supports_exact?

        warn "The :exact option only has an effect on queries using the XPath#is method. Using it with the query \"#{expression}\" has no effect."
      end

      def exact_text
        options.fetch(:exact_text, session_options.exact_text)
      end

      def describe_within?
        @resolved_node && !document?(@resolved_node) && !simple_root?(@resolved_node)
      end

      def document?(node)
        node.is_a?(::Capybara::Node::Document)
      end

      def simple_root?(node)
        node.is_a?(::Capybara::Node::Simple) && node.path == '/'
      end

      def apply_filter?(filter)
        filter.format.nil? || (filter.format == selector_format)
      end

      def matches_locator_filter?(node)
        return true unless @selector.locator_filter && apply_filter?(@selector.locator_filter)

        @selector.locator_filter.matches?(node, @locator, @selector, exact: exact?)
      end

      def matches_system_filters?(node)
        applied_filters << :system

        matches_visibility_filters?(node) &&
          matches_id_filter?(node) &&
          matches_class_filter?(node) &&
          matches_style_filter?(node) &&
          matches_text_filter?(node) &&
          matches_exact_text_filter?(node)
      end

      def matches_id_filter?(node)
        return true unless use_default_id_filter? && options[:id].is_a?(Regexp)

        options[:id].match? node[:id]
      end

      def matches_class_filter?(node)
        return true unless use_default_class_filter? && options[:class].is_a?(Regexp)

        options[:class].match? node[:class]
      end

      def matches_style_filter?(node)
        case options[:style]
        when String, nil
          true
        when Regexp
          options[:style].match? node[:style]
        when Hash
          matches_style?(node, options[:style])
        end
      end

      def matches_style?(node, styles)
        @actual_styles = node.initial_cache[:style] || node.style(*styles.keys)
        styles.all? do |style, value|
          if value.is_a? Regexp
            value.match? @actual_styles[style.to_s]
          else
            @actual_styles[style.to_s] == value
          end
        end
      end

      def matches_text_filter?(node)
        value = options[:text]
        return true unless value
        return matches_text_exactly?(node, value) if exact_text == true

        regexp = value.is_a?(Regexp) ? value : Regexp.escape(value.to_s)
        matches_text_regexp?(node, regexp)
      end

      def matches_exact_text_filter?(node)
        return true unless exact_text.is_a?(String)

        matches_text_exactly?(node, exact_text)
      end

      def matches_visibility_filters?(node)
        obscured = options[:obscured]
        return (visible != :hidden) && (node.initial_cache[:visible] != false) && !node.obscured? if obscured == false

        vis = case visible
        when :visible
          node.initial_cache[:visible] || (node.initial_cache[:visible].nil? && node.visible?)
        when :hidden
          (node.initial_cache[:visible] == false) || (node.initial_cache[:visbile].nil? && !node.visible?)
        else
          true
        end

        vis && case obscured
               when true
                 node.obscured?
               when false
                 !node.obscured?
               else
                 true
               end
      end

      def matches_text_exactly?(node, value)
        regexp = value.is_a?(Regexp) ? value : /\A#{Regexp.escape(value.to_s)}\z/
        matches_text_regexp?(node, regexp)
      end

      def normalize_ws
        options.fetch(:normalize_ws, session_options.default_normalize_ws)
      end

      def matches_text_regexp?(node, regexp)
        text_visible = visible
        text_visible = :all if text_visible == :hidden
        node.text(text_visible, normalize_ws: normalize_ws).match?(regexp)
      end

      def default_visibility
        @selector.default_visibility(session_options.ignore_hidden_elements, options)
      end

      def builder(expr)
        selector.builder(expr)
      end
    end
  end
end

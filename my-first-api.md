## >> Requisitos
```
$ ruby -v
$ rails -v
$ gem update rails


## >> Setup del Proyecto
$ rails new todos-api --api -T
```
** AQUI VA A FALLAR **

### --> Cambios en el Gemfile
Reemplazar la linea de ```gem 'sqlite3'``` por:
```
gem 'sqlite3', git: "gem 'sqlite3', git: "https://github.com/sparklemotion/sqlite3-ruby"


```
# Gemfile
group :development, :test do
  gem 'rspec-rails', '~> 3.5'
end

# Gemfile
group :test do
  gem 'factory_bot_rails', '~> 4.0'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'faker'
  gem 'database_cleaner'
end


$ bundle install
$ rails generate rspec:install
$ mkdir spec/factories
```

## >> Configuración
```
# spec/rails_helper.rb

# require database cleaner at the top level
require 'database_cleaner'

# [...]
# configure shoulda matchers to use rspec as the test framework and full matcher libraries for rails
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

# [...]
RSpec.configure do |config|
  # [...]
  # add `FactoryBot` methods
  config.include FactoryBot::Syntax::Methods

  # start by truncating all the tables but then use the faster transaction strategy the rest of the time.
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end

  # start the transaction strategy as examples are run
  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
  # [...]
end
```

## >> Modelos
```
$ rails g model Todo title:string created_by:string
# revisar archivo db

$ rails g model Item name:string done:boolean todo:references
# revisar archivo db


$ rails db:migrate

# Crear archivo de tests
# spec/models/todo_spec.rb
require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Todo, type: :model do
  # Association test
  # ensure Todo model has a 1:m relationship with the Item model
  it { should have_many(:items).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:created_by) }
end


# spec/models/item_spec.rb
require 'rails_helper'

# Test suite for the Item model
RSpec.describe Item, type: :model do
  # Association test
  # ensure an item record belongs to a single todo record
  it { should belong_to(:todo) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:name) }
end


# ejecutar specs
$ bundle exec rspec
```


_Arreglar problema con los specs_
```
# app/models/todo.rb
class Todo < ApplicationRecord
  # model association
  has_many :items, dependent: :destroy

  # validations
  validates_presence_of :title, :created_by
end


# app/models/item.rb
class Item < ApplicationRecord
  # model association
  belongs_to :todo

  # validation
  validates_presence_of :name
end
```



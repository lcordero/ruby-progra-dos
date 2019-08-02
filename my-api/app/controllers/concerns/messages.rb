module Messages
	def alert(msg='this is an alert')
		render json: '#{msg : msg}', status: :ok
	end
	def success(msg='this was success')
		render jsom: '#{msg : msg}', status: :ok
	end
	def error(msg='this is an error')
		render json: '#{msg : msg}', status: :ok
	end
	def info(msg='this is just info')
		render json#{msg : msg}', status: :ok

	end
end

module Messages
    def alert(msg= "This is an alert")
        render json: '#{msg}', status: :ok
    end
    def succes(msg= 'This is an error')
        render json: '#{msg}', status: :ok
    end
    def error(msg= 'This is just info')
        render json: '#{msg}', status: :ok
    end
    def info (msg= 'This is just info')
        render json: '#{msg}', status: :ok
end

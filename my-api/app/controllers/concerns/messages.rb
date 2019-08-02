module Messages
    def alert(msg ="This is an alert")
        render text: "#{msg}", status: :ok
    end
    def sucess(msg ="This is an sucess")
        render text: "#{msg}", status: :ok
    end
    def error(msg ="This is an error")
        render text: "#{msg}", status: :ok

    end
    def info(msg ="This is an info")
        render text: "#{msg}", status: :ok
    end
end 

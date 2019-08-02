module Messages

  def alert(msg='This is an alert')
      render json: {'msg': msg}, status: :ok
  end

  def success(msg='This was success')
      render json: {'msg': msg}, status: :ok
  end

  def error(msg='this is an error')
      render json: {'msg': msg}, status: :ok
  end

  def info(msg='This is just info')
      render json: {'msg': msg}, status: :ok
  end
end

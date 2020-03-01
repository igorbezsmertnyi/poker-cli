class Token
  def save(token)
    File.open('./auth_token', 'w') { |file| file.puts token }
  end

  def get
    if File.exist?('./auth_token')
      File.open('./auth_token', 'r').read
    end
  end
end

class Token
  def save(token)
    File.open('./auth_token', 'w') { |file| file.puts token }
  end

  def get
    File.open('./auth_token').read
  end
end

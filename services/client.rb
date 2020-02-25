require 'faraday'
require 'json'
require_relative './token'

class Client
  attr_accessor :connection
  attr_reader   :token

  def initialize
    @token      = ::Token.new.get
    @url        = "https://codest-poker.herokuapp.com/"
    @connection = Faraday.new(@url)
    connection.headers = { 'Auth-Token': token }
  end

  def get(path)
    connection.get(path)
  end

  def post(path, params)
    connection.post(path, params)
  end

  def put(path, params)
    connection.put(path, params)
  end
end

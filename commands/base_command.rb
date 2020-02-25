require 'dry/cli'
require 'json'
require 'colorize'
require_relative './../services/client'

class BaseCommand < Dry::CLI::Command
  private

  attr_reader :reponse

  def success(text)
    puts text.green
  end

  def error(text)
    puts "Error: #{text}".red
  end

  def client
    ::Client.new
  end

  def parsed_response
    ::JSON.parse(reponse.body)
  end

  def error_response
    parsed_response.join(', ')
  end
end
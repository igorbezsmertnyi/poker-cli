require 'dry/cli'

class Version < Dry::CLI::Command
  def call(*)
    puts "Version: 1.0.0"
  end
end

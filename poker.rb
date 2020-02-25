#!/usr/bin/env ruby

require 'bundler/setup'
require 'dry/cli'

require './commands/version'
require './commands/auth'
require './commands/update'
require './commands/pokers/list'
require './commands/pokers/show'
require './commands/pokers/create'
require './commands/vote'

module Poker
  module CLI
    module Commands
      extend Dry::CLI::Registry
    end
  end
end

Poker::CLI::Commands.register "-v", Version
Poker::CLI::Commands.register "auth", Auth
Poker::CLI::Commands.register "update", Update

Poker::CLI::Commands.register "pokers" do |prefix|
  prefix.register "list", Pokers::List
  prefix.register "show", Pokers::Show
  prefix.register "create", Pokers::Create
end

Poker::CLI::Commands.register "vote", Vote

Dry::CLI.new(Poker::CLI::Commands).call

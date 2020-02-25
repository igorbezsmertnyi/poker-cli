require 'terminal-table'
require_relative './base'

module Outputer
  class VotesTable < Base
    attr_reader :attributes, :table, :max_option, :max_size

    def initialize(attributes)
      @table      = nil
      @max_option = 0
      @max_size   = 0
      @attributes = attributes
    end

    def print
      super
      create_table
  
      puts "Final note: #{max_option}"
      puts table
    end

    private

    def create_table
      @table = Terminal::Table.new(headings: %w[option names]) do |t|
        [1, 2, 3, 4, 5, 8].map do |option|
          values = attributes.select { |r| r["option"] == option }
          names = values.empty? ? '-' : values.map { |v| v["name"] }.join(', ')

          if values.size > max_size
            @max_option = option
            @max_size = values.size
          end
          
          t.add_row [option, names]
        end
      end
    end
  end
end

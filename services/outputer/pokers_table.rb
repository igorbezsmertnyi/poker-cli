require 'terminal-table'
require_relative './base'

module Outputer
  class PokersTable < Base
    attr_reader :attributes

    def initialize(attributes)
      @attributes = attributes
    end

    def print
      super
      puts table
    end

    private

    def table
      Terminal::Table.new(headings: %w[id title status]) do |t|
        attributes.each do |row|
          t.add_row row.slice('id', 'title', 'state').values
        end
      end
    end
  end
end

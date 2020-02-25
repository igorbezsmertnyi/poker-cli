require_relative './base'

module Outputer
  class Progress < Base
    attr_reader :total, :current

    def initialize(total:, current:)
      @total   = total
      @current = current
    end

    def print
      super
      puts "[#{progress_bar}] [#{current} of #{total} votes added]"
    end

    private

    def progress_bar
      (0..9).map do |i|
        i <= percentage ? '#' : ' '
      end.join('')
    end

    def percentage
      (10 / total) * current
    end
  end
end

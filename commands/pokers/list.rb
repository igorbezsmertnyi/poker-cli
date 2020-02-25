require_relative '../../services/outputer/pokers_table'
require_relative '../base_command'

module Pokers
  class List < BaseCommand
    def call(*)
      @reponse = client.get("/pokers")
  
      if @reponse.success?
        Outputer::PokersTable.new(parsed_response["pokers"]).print
      else
        error(error_response)
      end
    end
  end
end

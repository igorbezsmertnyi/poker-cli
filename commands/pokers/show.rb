require_relative '../../services/outputer/votes_table'
require_relative '../base_command'

module Pokers
  class Show < BaseCommand
    argument :poker, required: true, desc: "Provide poker title"

    def call(poker:)
      @reponse = client.get("/pokers/#{poker}")
  
      if @reponse.success?
        Outputer::VotesTable.new(reponse_attributes).print
      else
        error(error_response)
      end
    end

    private

    def reponse_attributes
      parsed_response["votes"]["data"].map { |r| r["attributes"] }
    end
  end
end

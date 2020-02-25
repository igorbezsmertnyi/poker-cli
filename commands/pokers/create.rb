require_relative '../base_command'

module Pokers
  class Create < BaseCommand
    argument :title, required: true, desc: "Provide poker title"
    argument :counter, required: true, desc: "Provide total number of votes"
  
    def call(title:, counter:)
      @reponse = client.post("/pokers", { poker: { title: title, counter: counter} })
  
      if @reponse.success?
        success("Poker #{title} started")
      else
        error(error_response)
      end
    end
  end
end

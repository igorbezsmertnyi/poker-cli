require_relative '../services/outputer/progress'
require_relative '../services/outputer/votes_table'
require_relative './base_command'

class Vote < BaseCommand
  argument :poker, required: true, desc: "Provide poker title"
  argument :option, required: true, desc: "Provide your option"

  def call(poker:, option:)
    @reponse = client.post("/pokers/#{poker}/votes", { vote: { option: option }})

    if @reponse.success?
      get_status(poker)
    else
      error(error_response)
    end
  end

  private

  def get_status(poker)
    status  = ::JSON.parse(client.get("/pokers/#{poker}").body)
    total   = status['poker']['counter']
    current = status['votes']['data'].size
    votes   = status['votes']['data'].map { |r| r["attributes"] }

    Outputer::Progress.new(total: total, current: current).print

    if status['poker']['state'] == 'started'
      sleep(5)
      get_status(poker)
    else
      Outputer::VotesTable.new(votes).print
    end
  end
end

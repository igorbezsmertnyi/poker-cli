require_relative './base_command'

class Auth < BaseCommand
  argument :name, required: true, desc: "The name of team mate"

  def call(name:)
    @reponse = client.post("/users", { user: { name: name }})

    if @reponse.success?
      save_toke
      success("Welcome, #{name}!")
    else
      error(error_response)
    end
  end

  private

  def save_toke
    ::Token.new.save(parsed_response["token"])
  end
end

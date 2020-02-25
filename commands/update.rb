require_relative './base_command'

class Update < BaseCommand
  argument :name, required: true, desc: "Provide the name"

  attr_reader :reponse

  def call(name:)
    @reponse = client.put("/users", { user: { name: name }})
    success("Name succesfullu updated to `#{name}`")
  rescue => e
    error(error_response)
  end
end

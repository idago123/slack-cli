require_relative 'recipient'

class User < Recipient
  attr_reader :real_name

  def initialize(slack_id:, name:, real_name:)
    super(slack_id: slack_id, name: name)
    @real_name = real_name
    # @status_text
    # @status_emoji
  end

  def details
    return "Name: #{@real_name}, ID: #{@slack_id}, Username: #{@name}"
  end

  def self.list_all
    response = self.get(USERS_URL, PARAMS)

    response["members"].map do |member|
      User.new(
          slack_id: member["id"],
          name: member["name"],
          real_name: member["real_name"]
      )
    end
  end
end
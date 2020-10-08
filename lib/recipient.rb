require 'httparty'
require 'dotenv'

Dotenv.load

class SlackApiError < StandardError; end

class Recipient
  USERS_URL = 'https://slack.com/api/users.list'
  CHANNELS_URL = 'https://slack.com/api/conversations.list'
  MESSAGE_URL = 'https://slack.com/api/chat.postMessage'
  PARAMS = 'SLACK_API_TOKEN'
  SLACK_BOT_TOKEN = 'SLACK_BOT_API_TOKEN'

  attr_reader :slack_id, :name

  def initialize(slack_id: nil, name: nil)
    @slack_id = slack_id
    @name = name
  end

  def self.get(url, params)
    sleep(0.5)
    HTTParty.get(url, query: {token: ENV[params]})
  end

  def send_message(message)
    sleep(0.5)

    response = HTTParty.post(
        MESSAGE_URL,
        body: {
          token: ENV[SLACK_BOT_TOKEN],
          channel: @slack_id,
          text: message
        },
        headers: { 'Content-Type' => 'application/x-www-form-urlencoded' }
    )

    unless response.code == 200 && response.parsed_response["ok"]
      raise SlackApiError, "Error when posting #{message} to #{@slack_id}, error: #{response.parsed_response["error"]}"
    end

  end

  def details
    raise NotImplementedError, 'Implement me in a child class!'
  end

  def self.list_all
    raise NotImplementedError, 'Implement me in a child class!'
  end

end
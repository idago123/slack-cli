require 'httparty'
require 'dotenv'
require_relative 'recipient'

Dotenv.load

CHANNELS_URL = 'https://slack.com/api/conversations.list'

class Channel < Recipient
  attr_reader :topic, :member_count

  def initialize
    @topic
    @member_count
  end

  def self.details
    self.list_all["channels"].each do |channel|
      puts "name: #{channel["name"]}, topic: #{channel["topic"]}
      id: #{channel["id"]} member count: #{channel["num_members"]}"
    end
  end

  def self.list_all
    self.get(CHANNELS_URL, PARAMS)
  end
end
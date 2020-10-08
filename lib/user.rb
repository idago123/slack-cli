require 'httparty'
require 'dotenv'
require_relative 'recipient'

Dotenv.load

USERS_URL = 'https://slack.com/api/users.list'

class User < Recipient
  attr_reader :real_name, :status_text, :status_emoji

  def initialize
    super(slack_id)
    super(name)
    @real_name
    @status_text
    @status_emoji
  end

  def self.details
    self.list_all["members"].each do |member|
      puts "Name: #{member["real_name"]}, ID: #{member["id"]} Username: #{member["name"]}"
    end
  end

  def self.list_all
    self.get(USERS_URL, PARAMS)
  end
end
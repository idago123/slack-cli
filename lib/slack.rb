#!/usr/bin/env ruby

require 'dotenv'
require 'httparty'
require 'table_print'

require_relative 'workspace'
Dotenv.load

USERS_URL = 'https://slack.com/api/users.list'
CHANNELS_URL = 'https://slack.com/api/conversations.list'
MESSAGE_URL = 'https://slack.com/api/chat.postMessage'

def list_users(response)
  response["members"].each do |member|
    puts "Name: #{member["real_name"]}, ID: #{member["id"]} Username: #{member["display_name"]}"
  end
end

def list_channels(response)
  #I should see a list of all the channels for that workspace.
  # This list should include the channel's name, topic, member count, and Slack ID.
  response["channels"].each do |channel|
    puts "name: #{channel["name"]}, topic: #{channel["topic"]}
    id: #{channel["id"]} member count: #{channel["num_members"]}"
  end
end

def main
  puts "Welcome to the Ada Slack CLI!"
  workspace = Workspace.new

  # TODO project

  channel_response = HTTParty.get(CHANNELS_URL, query: {
       token: ENV['SLACK_API_TOKEN']
  })

  user_response = HTTParty.get(USERS_URL, query: {
      token: ENV['SLACK_API_TOKEN']
  })

  puts "We have #{channel_response["channels"].size} channels and #{user_response["members"].size} users loaded.\n"

  end_program = false
  until end_program
    puts "There are three options to interact with this program. Please pick one: "
    puts "1. list users"
    puts "2. list channels"
    puts "3. quit\n\n"

    user_input = gets.chomp

    case user_input
    when "list users"
      list_users(user_response)
    when "list channels"
      list_channels(channel_response)
    when "quit"
      puts "Thank you for using the Ada Slack CLI"
      end_program = true
    end
  end





end

main if __FILE__ == $PROGRAM_NAME


# require 'dotenv'
# require 'httparty'
#
# Dotenv.load
#
# def main
#   puts "Welcome to the Ada Slack CLI!"
#   #workspace = Workspace.new
#
#   # TODO project
#   puts ENV['SLACK_API_TOKEN']
#   response = HTTParty.post('https://slack.com/api/chat.postMessage', body: {
#       token: ENV['SLACK_API_TOKEN'],
#       channel: 'test-channel2',
#       text: "my test"
#   })
#   pp response
#   puts "Thank you for using the Ada Slack CLI"
# end
#
# main if __FILE__ == $PROGRAM_NAME
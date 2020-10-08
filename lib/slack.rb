#!/usr/bin/env ruby

require 'table_print'
require_relative 'workspace'

def main
  puts "Welcome to the Ada Slack CLI!"

  workspace = Workspace.new

  puts "We have #{workspace.channels["channels"].size} channels and #{workspace.users["members"].size} users loaded.\n"

  end_program = false
  until end_program
    puts "\nThere are several options to interact with this program. Please pick one: "
    puts "1. list users"
    puts "2. list channels"
    puts "3. select user"
    puts "4. select channel"
    puts "5. details"
    puts "6. quit\n\n"

    user_input = gets.chomp

    case user_input
    when "list users"
      User.details
    when "list channels"
      Channel.details
    when "select user"
      puts "Please enter a user name or user id:"
      select_user_input = gets.chomp
      workspace.select_user(select_user_input)
    when "select channel"
      puts "Select a channel name or id: "
      channel_input = gets.chomp
      workspace.select_channel(channel_input)
    when "details"
      workspace.show_details()
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
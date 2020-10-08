#!/usr/bin/env ruby

require 'table_print'
require_relative 'workspace'

def main
  puts "Welcome to the Ada Slack CLI!"

  workspace = Workspace.new

  puts "We have #{workspace.channels.size} channels and #{workspace.users.size} users loaded.\n"

  end_program = false
  until end_program
    puts "\nThere are several options to interact with this program. Please pick one: "
    puts "1. list users"
    puts "2. list channels"
    puts "3. select user"
    puts "4. select channel"
    puts "5. details"
    puts "6. send message"
    puts "7. quit\n\n"

    user_input = gets.chomp

    case user_input
    when "list users"
      tp User.list_all, "real_name", "slack_id", "name"
    when "list channels"
      tp Channel.list_all, "name", "topic", "slack_id", "member_count"
    when "select user"
      puts "Please enter a user name or user id:"
      select_user_input = gets.chomp
      workspace.select_user(select_user_input)
    when "select channel"
      puts "Select a channel name or id:"
      channel_input = gets.chomp
      workspace.select_channel(channel_input)
    when "details"
      puts workspace.show_details
    when "send message"
      workspace.send_message
    when "quit"
      puts "Thank you for using the Ada Slack CLI"
      end_program = true
    end
  end
end

main if __FILE__ == $PROGRAM_NAME



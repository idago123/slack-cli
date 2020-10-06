#!/usr/bin/env ruby

require 'dotenv'
require 'httparty'

Dotenv.load

def main
  puts "Welcome to the Ada Slack CLI!"
  #workspace = Workspace.new

  # TODO project
  puts ENV['SLACK_API_TOKEN']
  response = HTTParty.get('https://slack.com/api/conversations.list', query: {
      token: ENV['SLACK_API_TOKEN']
  })
  pp response
  puts "Thank you for using the Ada Slack CLI"
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
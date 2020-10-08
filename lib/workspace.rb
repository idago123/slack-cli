require_relative 'user'
require_relative 'channel'

MESSAGE_URL = 'https://slack.com/api/chat.postMessage'

class Workspace
  attr_reader :users, :channels, :selected

  def initialize
    @users = User.list_all
    @channels = Channel.list_all
    @selected
  end

  def select_user(user)
    @users["members"].each do |member|
      if user == member["id"] || user == member["name"]
        @selected = member
      end
    end

    if @selected.nil?
      puts "This user was not found."
    end

    return @selected
  end

  def select_channel(name)
    @channels["channels"].each do |channel|
      if name == channel["name"] || name == channel["id"]
        @selected = channel
      end
    end

    if @selected.nil?
      puts "This channel was not found."
    end

    return @selected
  end

  def show_details
    if @selected.nil?
      puts "No recipient is currently selected."
      return
    end

    if @selected["is_channel"]
      puts "Name: #{@selected["name"]}, Topic: #{@selected["topic"]}
      ID: #{@selected["id"]} Member Count: #{@selected["num_members"]}"
    else
      puts "Name: #{@selected["real_name"]}, ID: #{@selected["id"]} Username: #{@selected["name"]}"
    end
  end
end
require_relative 'user'
require_relative 'channel'

class Workspace
  attr_reader :users, :channels, :selected

  def initialize
    @users = User.list_all
    @channels = Channel.list_all
    @selected = nil
  end

  def select_user(user)
    @users.each do |member|
      if user == member.slack_id || user == member.name
        @selected = member
      end
    end

    if @selected.nil?
      puts "This user was not found."
    end

    return @selected
  end

  def select_channel(name)
    @channels.each do |channel|
      if name == channel.name || name == channel.slack_id
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

    @selected.details
  end

  def send_message
    if @selected.nil?
      puts "No recipient is currently selected to send a message to."
      return
    end

    puts "Please enter a message:"
    message = gets.chomp

    @selected.send_message(message)
  end
end
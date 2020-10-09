require_relative 'test_helper'

describe "Channel class" do

  describe "list_all" do
    it "get channels" do
      VCR.use_cassette("channel") do
        response = Channel.list_all
        expect(response[0].name).wont_be_nil
        expect(response[0].name).must_equal "random"
        expect(response[0].slack_id).must_equal "C01BW93UN8N"
        expect(response[0].member_count).must_equal 4
      end
    end
  end

  describe "send_message" do
    it "recipient" do
      VCR.use_cassette("channel") do
        expect {
          new_recipient = Channel.new(slack_id: "fake", name: "fake", topic: "fake", member_count: "fake")
          new_recipient.send_message("This post should not work")
        }.must_raise SlackApiError
      end
    end
    it "sends a message to a channel" do
      VCR.use_cassette("channel") do
          new_recipient = Channel.new(slack_id: "C01BW93UN8N", name: "random", topic: "super random!", member_count: 3)
          expect(new_recipient.send_message("hello testing").code).must_equal 200
      end
    end

  end

  describe "details" do
    it "must return correct details" do
      test_channel = Channel.new(slack_id: "12345", name: "ida.goitom", topic: "happy", member_count: 5)
      expect(test_channel.details).must_equal "Name: ida.goitom, ID: 12345, Topic: happy, Member count: 5"
    end
  end

end
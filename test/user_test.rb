require_relative 'test_helper'

describe "User class" do

  describe "list_all" do
    it "get users" do
      VCR.use_cassette("user") do
        response = User.list_all

        expect(response[0].name).wont_be_nil
        expect(response[0].name).must_equal "slackbot"
        expect(response[0].real_name).must_equal "Slackbot"
      end
    end
  end

  describe "details" do
    it "must return correct details" do
      test_user = User.new(slack_id: "891012", name: "anna" , real_name: "anna")
      expect(test_user.details).must_equal "Name: anna, ID: 891012, Username: anna"
    end
  end
end

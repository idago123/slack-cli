require_relative 'test_helper'

describe "Channel class" do
  # let(:user) { User.new }

  describe "list_all" do
    it "get channels" do
      VCR.use_cassette("channel") do
        response = Channel.list_all

        expect(response["channels"][0]["name"]).wont_be_nil
        expect(response["channels"][0]["name"]).must_equal "random"
        expect(response["channels"][0]["id"]).must_equal "C01BW93UN8N"
        expect(response["channels"][0]["num_members"]).must_equal 2
      end
    end

    # it "will raise an exception if the search fails" do
    #   VCR.use_cassette("location_find") do
    #     location = ""
    #     expect {
    #       response = get_location(location)
    #     }.must_raise SearchError
    #   end
    # end
  end
end
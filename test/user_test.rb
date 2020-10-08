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
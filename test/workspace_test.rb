require_relative 'test_helper'

describe "Workspace Class" do
  let(:workspace) { Workspace.new }

  describe 'constructor' do
    it 'is set up for specific attributes and data types' do
      VCR.use_cassette("workspace") do
        [:users, :channels, :selected].each do |prop|
          expect(workspace).must_respond_to prop
        end
      end
    end
  end

  describe 'select_user' do
    # it "throws an argument error with a bad ID" do
    #   # workspace = Workspace.new
    #   VCR.use_cassette("id_error") do
    #     expect{ workspace.select_user('fake') }.must_raise ArgumentError
    #   end
    # end
  end

  describe 'select_channel' do
    # it "throws an argument error with a bad ID" do
    #   VCR.use_cassette("workspace") do
    #     expect{ workspace.select_channel('fake') }.must_raise ArgumentError
    #   end
    # end
  end
end


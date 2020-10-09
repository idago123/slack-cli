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
    it "selects the user" do
      VCR.use_cassette("workspace") do
        workspace.select_user("ida.goitom")
        expect(workspace.selected.name).must_equal "ida.goitom"
      end
    end
  end

  describe 'select_channel' do
    it "selects the right channel when provided name or ID" do
      VCR.use_cassette("workspace") do
        workspace.select_channel("random")
        expect(workspace.selected.name).must_equal "random"
      end
    end
  end
end


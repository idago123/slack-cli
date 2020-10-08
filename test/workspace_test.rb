require_relative 'test_helper'
require_relative 'workspace'

describe "Workspace Class" do
  let "workspace instance" do
    workspace = Workspace.new
  end

  describe 'constructor' do
    it 'is set up for specific attributes and data types' do
      #workspace = Workspace.new

      [:users, :channels, :selected].each do |prop|
        expect(workspace).must_respond_to prop
      end
    end
  end

  describe 'select_user' do
    it "throws an argument error with a bad ID" do
      # workspace = Workspace.new
      expect{ workspace.select_user('fake') }.must_raise ArgumentError
    end
  end

  describe 'select_channel' do
    it "throws an argument error with a bad ID" do
      # workspace = Workspace.new
      expect{ workspace.select_channel('fake') }.must_raise ArgumentError
    end
  end

  describe 'details' do
    it "throws an argument error with a bad ID" do
      #  workspace = Workspace.new
      expect{ workspace.details }.must_raise ArgumentError
    end
  end
end


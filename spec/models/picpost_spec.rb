require 'spec_helper'

describe Picpost do

  let(:user) { FactoryGirl.create(:user) }
  before do
    @picpost = user.picposts.build(caption: "Lorem ipsum") 
  end

  subject { @picpost }

  it { should respond_to(:caption) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "when user id is not present" do
    before { @picpost.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank caption" do
    before { @picpost.caption = " " }
    it { should be_valid }
  end

  describe "with caption that is too long" do
    before { @picpost.caption = "a" * 101 }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Picpost.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "when user_id is not present" do
    before { @picpost.user_id = nil }
    it { should_not be_valid }
  end

end

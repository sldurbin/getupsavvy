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
  it { should respond_to(:picture_ratings) }
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

  describe "picture_rating associations" do
    before { @picpost.save }
    let!(:older_picture_rating) do
      FactoryGirl.create(:picture_rating, picpost: @picpost, created_at: 1.day.ago, user: user)
    end
    let!(:newer_picture_rating) do
      FactoryGirl.create(:picture_rating, picpost: @picpost, created_at: 1.hour.ago, user: user)
    end
   
    it "should have the right picture_ratings in the right order" do
      @picpost.picture_ratings.should == [newer_picture_rating, older_picture_rating]
    end

    it "should destroy associated picture_ratings" do
      picture_ratings = @picpost.picture_ratings.dup
      @picpost.destroy
      picture_ratings.should_not be_empty
      picture_ratings.each do |pr|
        PictureRating.find_by_id(pr.id).should be_nil
      end
    end

  end

end

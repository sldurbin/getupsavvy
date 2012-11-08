require 'spec_helper'

describe PictureRating do
  let(:picpost) { FactoryGirl.create(:picpost) }
  let(:user) { FactoryGirl.create(:user) }
  before do
    @picture_rating = user.picture_ratings.build(rating: true, comment: "Test", picpost_id: picpost.id)
  end

  subject { @picture_rating }

  it { should respond_to(:rating) }
  it { should respond_to(:comment) }
  it { should respond_to(:picpost_id) }
  it { should respond_to(:picpost) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:picpost) { should == picpost }
  its(:user) { should == user }

  it { should be_valid }

  describe "when picpost_id is not present" do
    before { @picture_rating.picpost_id = nil }
    it { should_not be_valid }
  end
  
  describe "when user_id is not present" do 
    before { @picture_rating.user_id = nil }
    it { should_not be_valid }
  end

  # TODO:
  #describe "with false rating and blank comment" do
  #  before do
  #    @picture_rating.rating = false
  #    @picture_rating.comment = nil
  #  end
  #  it { should_not be_valid }
  #end

  describe "with true rating and blank comment" do
    before do
      @picture_rating.rating = true
      @picture_rating.comment = nil
    end
    it { should be_valid }
  end

  describe "with comment that is too long" do
    before { @picture_rating.comment = "a" * 101 }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        PictureRating.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

end

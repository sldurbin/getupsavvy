class CommentRating < ActiveRecord::Base
  attr_accessible :rated_id, :picture_comment_id, :rating

  belongs_to :rater, class_name: "User"
  belongs_to :rated, class_name: "User"
  belongs_to :picture_comment

  validates :rater_id, presence: true
  validates :rated_id, presence: true
  validates :picture_comment_id, presence: true
  #validates :rating, presence: true #TODO: validations fail when "false" is passed in. 
  #TODO: Validate uniqueness so two comment_ratings can not be created by the same user
end

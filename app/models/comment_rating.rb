class CommentRating < ActiveRecord::Base
  attr_accessible :rater_id

  belongs_to :rater, class_name: "User"
  belongs_to :rated, class_name: "User"
  #belongs_to :picture_comment

  validates :rater_id, presence: true
  validates :rated_id, presence: true
  validates :picture_comment_id, presence: true
  validates :rating, presence: true
end

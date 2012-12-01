class CommentRating < ActiveRecord::Base
  attr_accessible :rated_id, :picture_comment_id, :rating

  belongs_to :rater, class_name: "User"
  belongs_to :rated, class_name: "User"
  belongs_to :picture_comment

  validates :rater_id, presence: true
  validates :rated_id, presence: true
  validates :picture_comment_id, presence: true
  after_save :update_counter_caches
  after_destroy :update_counter_caches
  #validates :rating, presence: true #TODO: validations fail when "false" is passed in. 
  #TODO: Validate uniqueness so two comment_ratings can not be created by the same user

  def update_counter_caches
    good_comment_ratings_count = CommentRating.find_all_by_picture_comment_id_and_rating(self.picture_comment.user.picture_comments.map{ |p| p.id }, true).count
    bad_comment_ratings_count = CommentRating.find_all_by_picture_comment_id_and_rating(self.picture_comment.user.picture_comments.map{ |p| p.id }, false).count
    self.picture_comment.user.update_attribute(:good_comment_ratings_count, good_comment_ratings_count)
    self.picture_comment.user.update_attribute(:bad_comment_ratings_count, bad_comment_ratings_count)
  end
end

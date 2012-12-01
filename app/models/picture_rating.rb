class PictureRating < ActiveRecord::Base
  attr_accessible :rating, :picpost_id
  belongs_to :picpost
  belongs_to :user

  validates :picpost_id, presence: true
  validates :user_id, presence: true

  default_scope order: 'picture_ratings.created_at DESC'
  after_save :update_counter_caches
  after_destroy :update_counter_caches


  def update_counter_caches
    good_picture_ratings_count = PictureRating.find_all_by_picpost_id_and_rating(self.picpost.user.picposts.map{ |p| p.id }, true).count
    bad_picture_ratings_count = PictureRating.find_all_by_picpost_id_and_rating(self.picpost.user.picposts.map { |p| p.id }, false)
    self.picpost.user.update_attribute(:good_picture_ratings_count, good_picture_ratings_count)
    self.picpost.user.update_attribute(:bad_picture_ratings_count, bad_picture_ratings_count)
  end
end

class PictureRating < ActiveRecord::Base
  attr_accessible :rating, :picpost_id
  belongs_to :picpost
  belongs_to :user

  validates :picpost_id, presence: true
  validates :user_id, presence: true

  default_scope order: 'picture_ratings.created_at DESC'
end

class PictureComment < ActiveRecord::Base
  attr_accessible :comment, :picpost_id

  belongs_to :user, counter_cache: true
  belongs_to :picpost
  has_one :comment_rating, dependent: :destroy
  
  validates :picpost_id, presence: true
  validates :user_id, presence: true

  default_scope order: 'picture_comments.created_at DESC'
end

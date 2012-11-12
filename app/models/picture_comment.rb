class PictureComment < ActiveRecord::Base
  attr_accessible :comment, :picpost_id

  belongs_to :user
  belongs_to :picpost
  
  validates :picpost_id, presence: true
  validates :user_id, presence: true

  default_scope order: 'picture_comments.created_at DESC'
end

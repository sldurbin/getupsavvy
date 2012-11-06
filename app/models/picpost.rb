class Picpost < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  attr_accessible :caption, :picture, :picture_cache
  belongs_to :user

  validates :user_id, presence: true
  validates :caption, length: { maximum: 100 }
 
  default_scope order: 'picposts.created_at DESC'
end

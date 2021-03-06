class Picpost < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  attr_accessible :caption, :picture, :picture_cache
  belongs_to :user, counter_cache: true
  has_many :picture_ratings, dependent: :destroy
  has_many :picture_comments, dependent: :destroy
  
  has_many :favorites, dependent: :destroy
  has_many :favored, through: :favorites, source: :user

  has_and_belongs_to_many :tags

  validates :user_id, presence: true
  validates :caption, length: { maximum: 100 }
 
  default_scope order: 'picposts.created_at DESC'

  def get_likes
    self.picture_ratings.reject { |pr| pr.rating == false }.count
  end

  def get_dislikes
    self.picture_ratings.reject { |pr| pr.rating == true }.count
  end

end

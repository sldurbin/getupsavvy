class Favorite < ActiveRecord::Base
  attr_accessible :picpost_id, :user_id

  belongs_to :user, counter_cache: true
  belongs_to :picpost

  validates :user_id, presence: true
  validates :picpost_id, presence: true

  after_save :update_counter_cache
  after_destroy :update_counter_cache


  def update_counter_cache
    favorited_count = Favorite.find_all_by_picpost_id(self.picpost.user.picposts { |p| p.id }).count
    self.picpost.user.update_attribute(:favorited_count, favorited_count) 
  end
end

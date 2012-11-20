class Favorite < ActiveRecord::Base
  attr_accessible :picpost_id, :user_id

  belongs_to :user
  belongs_to :picpost

  validates :user_id, presence: true
  validates :picpost_id, presence: true
end

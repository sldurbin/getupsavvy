class Tag < ActiveRecord::Base
  attr_accessible :link, :name
  validates :name, presence: true

  has_and_belongs_to_many :picposts
end

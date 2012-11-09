class PictureComment < ActiveRecord::Base
  attr_accessible :comment, :picpost_id

  belongs_to :user
  belongs_to :picpost
end

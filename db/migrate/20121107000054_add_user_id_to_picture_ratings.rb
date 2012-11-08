class AddUserIdToPictureRatings < ActiveRecord::Migration
  def change
    add_column :picture_ratings, :user_id, :integer
  end
end

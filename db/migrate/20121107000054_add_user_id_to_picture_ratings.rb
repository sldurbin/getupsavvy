class AddUserIdToPictureRatings < ActiveRecord::Migration
  def change
    add_column :picture_ratings, :user_id, :integer
    add_index :picture_ratings, :user_id
  end
end

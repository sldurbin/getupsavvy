class CreatePictureRatings < ActiveRecord::Migration
  def change
    create_table :picture_ratings do |t|
      t.boolean :rating
      t.integer :picpost_id

      t.timestamps
    end
    add_index :picture_ratings, [:picpost_id, :created_at]
  end
end

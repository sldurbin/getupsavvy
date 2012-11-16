class CreateCommentRatings < ActiveRecord::Migration
  def change
    create_table :comment_ratings do |t|
      t.integer :rater_id
      t.integer :rated_id
      t.boolean :rating
      t.integer :picture_comment_id

      t.timestamps
    end

    add_index :comment_ratings, :rater_id
    add_index :comment_ratings, :rated_id
    add_index :comment_ratings, :picture_comment_id
    add_index :comment_ratings, [:rater_id, :rated_id, :picture_comment_id], unique: true, name: 'unique_comment_ratings'
  end
end

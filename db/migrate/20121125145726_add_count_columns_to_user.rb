class AddCountColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :picposts_count, :integer, default: 0
    add_column :users, :picture_comments_count, :integer, default: 0
    add_column :users, :good_picture_ratings_count, :integer, default: 0
    add_column :users, :bad_picture_ratings_count, :integer, default: 0
    add_column :users, :good_comment_ratings_count, :integer, default: 0
    add_column :users, :bad_comment_ratings_count, :integer, default: 0
    add_column :users, :favorites_count, :integer, default: 0
    add_column :users, :favorited_count, :integer, default: 0
  end
end

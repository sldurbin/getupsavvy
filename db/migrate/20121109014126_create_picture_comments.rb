class CreatePictureComments < ActiveRecord::Migration
  def change
    create_table :picture_comments do |t|
      t.integer :user_id
      t.integer :picpost_id
      t.string :comment

      t.timestamps
    end
    add_index :picture_comments, :picpost_id
    add_index :picture_comments, :user_id
  end
end

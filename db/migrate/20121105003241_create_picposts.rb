class CreatePicposts < ActiveRecord::Migration
  def change
    create_table :picposts do |t|
      t.string :caption
      t.integer :user_id
      t.string :picture

      t.timestamps
    end
    add_index :picposts, [:user_id, :created_at]
  end
end

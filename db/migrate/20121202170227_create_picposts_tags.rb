class CreatePicpostsTags < ActiveRecord::Migration
  def up
    create_table :picposts_tags do |t|
      t.integer :picpost_id
      t.integer :tag_id
    end
  end

  def down
    drop_table :picposts_tags
  end
end

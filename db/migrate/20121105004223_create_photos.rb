class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :story_id
      t.integer :user_id
      t.string :image

      t.integer  "position",   :default => 0

      t.timestamps
    end

    add_index :photos, :story_id
    add_index :photos, :user_id
  end
end

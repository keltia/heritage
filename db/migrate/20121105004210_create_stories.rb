class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :description
      t.string :title
      t.integer :user_id

      t.timestamps
    end

    add_index :stories, :user_id
  end
end

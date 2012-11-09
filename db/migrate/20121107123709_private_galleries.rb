class PrivateGalleries < ActiveRecord::Migration
  def up
    add_column :stories, :is_private, :boolean, :default => false
    add_index :stories, [:is_private, :user_id]
  end

  def down
  end
end

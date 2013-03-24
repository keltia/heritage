class UserMainPhoto < ActiveRecord::Migration
  def change
    add_column :users, :main_photo, :string
    add_column :users, :main_photo_width, :integer
    add_column :users, :main_photo_height, :integer
  end

  def down
  end
end

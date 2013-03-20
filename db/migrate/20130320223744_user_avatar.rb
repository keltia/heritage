class UserAvatar < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :string
    drop_table :user_avatars
  end
end

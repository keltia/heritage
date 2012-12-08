class UsersTwitterUrl < ActiveRecord::Migration
  def up
    add_column :users, :twitter_url, :string
  end

  def down
  end
end

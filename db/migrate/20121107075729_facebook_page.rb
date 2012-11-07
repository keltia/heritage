class FacebookPage < ActiveRecord::Migration
  def up
    add_column :users, :facebook_url, :string
  end

  def down
  end
end

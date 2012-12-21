class UserBlogUrl < ActiveRecord::Migration
  def up
    add_column :users, :blog_url, :string
  end

  def down
  end
end

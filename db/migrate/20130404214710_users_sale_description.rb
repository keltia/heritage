class UsersSaleDescription < ActiveRecord::Migration
  def change
    add_column :users, :sale_description, :text
  end
end

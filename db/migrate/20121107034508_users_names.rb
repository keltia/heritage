class UsersNames < ActiveRecord::Migration
  def up
    add_column :users, :name, :string
    add_column :users, :description, :text
  end

  def down
  end
end

class UsersAllowSale < ActiveRecord::Migration
  def change
    add_column :users, :allow_sale, :boolean, :default => false
  end
end

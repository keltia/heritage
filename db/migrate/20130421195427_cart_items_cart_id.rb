class CartItemsCartId < ActiveRecord::Migration
  def change
    add_column :cart_items, :cart_id, :integer
    add_index :cart_items, :cart_id
    add_index :carts, :session_id
  end
end

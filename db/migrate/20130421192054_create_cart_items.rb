class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :count
      t.integer :photo_id
      t.integer :available_size_id
    end
  end
end

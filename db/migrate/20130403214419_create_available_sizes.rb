class CreateAvailableSizes < ActiveRecord::Migration
  def change
    create_table :available_sizes do |t|
      t.integer :user_id
      t.string :size
      t.string :price
      t.string :shipping_price
    end
    add_index :available_sizes, :user_id
  end
end

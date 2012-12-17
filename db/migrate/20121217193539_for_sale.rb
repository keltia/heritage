class ForSale < ActiveRecord::Migration
  def up
    add_column :photos, :for_sale, :boolean, :default => false
    add_index :photos, :for_sale
  end

  def down
  end
end

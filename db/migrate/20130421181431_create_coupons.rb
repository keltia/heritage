class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.integer :user_id
      t.text :description

      t.datetime :expires_at
      t.integer :num_available

      t.integer :purcent_reduction
      t.integer :number_reduction

      t.timestamps
    end

    add_index :coupons, :user_id
  end
end

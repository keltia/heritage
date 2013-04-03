class AvailableSizeDescription < ActiveRecord::Migration
  def change
    add_column :available_sizes, :description, :text
  end
end

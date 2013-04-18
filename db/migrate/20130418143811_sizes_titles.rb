class SizesTitles < ActiveRecord::Migration
  def change
    add_column :available_sizes, :title, :string
  end
end

class PhotoWidth < ActiveRecord::Migration
  def up
    add_column :photos, :width, :integer
    add_column :photos, :height, :integer
  end

  def down
  end
end

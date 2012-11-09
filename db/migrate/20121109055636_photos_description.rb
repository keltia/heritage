class PhotosDescription < ActiveRecord::Migration
  def up
    add_column :photos, :description, :text
  end

  def down
  end
end

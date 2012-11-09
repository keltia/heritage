class PhotoTitle < ActiveRecord::Migration
  def up
    add_column :photos, :title, :string
  end

  def down
  end
end

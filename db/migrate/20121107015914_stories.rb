class Stories < ActiveRecord::Migration
  def up
    add_column :stories, :position, :integer, :default => 0
  end

  def down
  end
end

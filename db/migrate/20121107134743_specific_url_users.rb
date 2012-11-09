class SpecificUrlUsers < ActiveRecord::Migration
  def up
    add_column :users, :specific_url, :string
    add_index :users, :specific_url
  end

  def down
  end
end

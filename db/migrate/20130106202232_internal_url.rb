class InternalUrl < ActiveRecord::Migration
  def up
    add_column :users, :internal_url, :string
    add_index :users, :internal_url
  end

  def down
  end
end

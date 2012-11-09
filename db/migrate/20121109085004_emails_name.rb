class EmailsName < ActiveRecord::Migration
  def up
    add_column :emails, :name, :string
  end

  def down
  end
end

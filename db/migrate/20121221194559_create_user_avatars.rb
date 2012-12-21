class CreateUserAvatars < ActiveRecord::Migration
  def change
    create_table :user_avatars do |t|
      t.integer :user_id
      t.string :image
      t.integer  "width"
      t.integer  "height"

      t.timestamps
    end
  end
end

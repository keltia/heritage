class GoogleTrackingId < ActiveRecord::Migration
  def up
    add_column :users, :google_tracking_id, :string
  end

  def down
  end
end

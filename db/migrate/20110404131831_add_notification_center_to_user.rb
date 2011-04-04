class AddNotificationCenterToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :notification_center, :string
  end

  def self.down
    remove_column :users, :notification_center
  end
end

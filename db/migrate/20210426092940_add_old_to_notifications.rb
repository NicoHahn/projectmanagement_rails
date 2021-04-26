class AddOldToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :old, :boolean
  end
end

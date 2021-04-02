class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :notification_type
      t.integer :sender_id
      t.integer :user_id
      t.references :associatable, polymorphic: true, null: false

      t.timestamps
    end
  end
end

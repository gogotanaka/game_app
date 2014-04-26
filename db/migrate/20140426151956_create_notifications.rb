class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :from_user_id
      t.integer :video_id
      t.integer :kind
      t.boolean :have_read

      t.timestamps
    end
  end
end

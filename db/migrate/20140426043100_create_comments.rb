class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :contents
      t.integr :user_id
      t.integr :video_id

      t.timestamps
    end
  end
end

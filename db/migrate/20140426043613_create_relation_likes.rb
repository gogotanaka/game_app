class CreateRelationLikes < ActiveRecord::Migration
  def change
    create_table :relation_likes do |t|
      t.integr :user_id
      t.integr :video_id
      t.integer :relation_add_id

      t.timestamps
    end
  end
end

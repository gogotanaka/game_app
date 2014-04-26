class CreateRelationLikes < ActiveRecord::Migration
  def change
    create_table :relation_likes do |t|
      t.integer :user_id
      t.integer :video_id
      t.integer :relation_add_id

      t.timestamps
    end
  end
end

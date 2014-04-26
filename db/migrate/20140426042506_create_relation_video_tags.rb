class CreateRelationVideoTags < ActiveRecord::Migration
  def change
    create_table :relation_video_tags do |t|
      t.integer :video_id
      t.integer :tag_id

      t.timestamps
    end
  end
end

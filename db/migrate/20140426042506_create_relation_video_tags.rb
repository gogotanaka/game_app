class CreateRelationVideoTags < ActiveRecord::Migration
  def change
    create_table :relation_video_tags do |t|
      t.integr :video_id
      t.integr :tag_id

      t.timestamps
    end
  end
end

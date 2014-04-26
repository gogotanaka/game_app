class CreateRelationAdds < ActiveRecord::Migration
  def change
    create_table :relation_adds do |t|
      t.integr :user_id
      t.integr :video_id

      t.timestamps
    end
  end
end

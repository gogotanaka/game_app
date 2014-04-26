class CreateRelationAdds < ActiveRecord::Migration
  def change
    create_table :relation_adds do |t|
      t.integer :user_id
      t.integer :video_id
      t.integer :from_user_id

      t.timestamps
    end
  end
end

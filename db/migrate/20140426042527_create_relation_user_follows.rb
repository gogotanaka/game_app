class CreateRelationUserFollows < ActiveRecord::Migration
  def change
    create_table :relation_user_follows do |t|
      t.integer :user_id
      t.integer :follow_id

      t.timestamps
    end
  end
end

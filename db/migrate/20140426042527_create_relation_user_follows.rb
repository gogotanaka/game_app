class CreateRelationUserFollows < ActiveRecord::Migration
  def change
    create_table :relation_user_follows do |t|
      t.integr :user_id
      t.integr :follow_id

      t.timestamps
    end
  end
end

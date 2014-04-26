class RelationAdd < ActiveRecord::Base
  belongs_to :user
  belongs_to :video, touch: true
  belongs_to :from_user, foreign_key: "from_user_id", class_name: "User"
end

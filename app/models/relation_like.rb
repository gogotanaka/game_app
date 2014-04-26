class RelationLike < ActiveRecord::Base
  belongs_to :user
  belongs_to :video, touch: true
end

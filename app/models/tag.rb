class Tag < ActiveRecord::Base
  has_many :relation_video_tags, dependent: :destroy
  has_many :viedos, through: :relation_video_tags
end

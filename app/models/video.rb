class Video < ActiveRecord::Base

  has_many :movies

  has_many :relation_video_tags, dependent: :destroy
  #このtagがついているpin
  has_many :tags, through: :relation_video_tags

  has_many :comments
end

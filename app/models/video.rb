class Video < ActiveRecord::Base

  has_many :movies

  has_many :relation_video_tags, dependent: :destroy
  #このtagがついているpin
  has_many :tags, through: :relation_video_tags, source: :tag

  has_many :comments

  attr_reader :tag_tokens

  def tag_tokens=(tokens)
    self.tag_ids = Tag.ids_from_tokens(tokens)
  end
end

class Video < ActiveRecord::Base

  has_many :movies

  has_many :relation_video_tags, dependent: :destroy
  #このtagがついているpin
  has_many :tags, through: :relation_video_tags, source: :tag

  has_many :relation_adds
  has_many :relation_likes

  has_many :comments

  belongs_to :user

  attr_reader :tag_tokens

  def tag_tokens=(tokens)
    self.tag_ids = Tag.ids_from_tokens(tokens)
  end

  def add_count
    relation_adds.count
  end

  def like_count
    relation_likes.count
  end
end

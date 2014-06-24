class Tag < ActiveRecord::Base
  has_many :relation_video_tags, dependent: :destroy
  has_many :videos, through: :relation_video_tags

  def self.ids_from_tokens(tokens)
    tokens.gsub!(/<<<(.+?)>>>/) { create!(name: $1).id }
    tokens.split(',')
  end
end

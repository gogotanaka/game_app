class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :relation_user_follows, dependent: :destroy
  has_many :follows, through: :relation_user_follows, source: :follow

  has_many :reverse_relation_user_follows, foreign_key: "follow_id", class_name: "RelationUserFollow", dependent: :destroy
  has_many :followers, through: :reverse_relation_user_follows, source: :user

  has_many :relation_adds
  has_many :add_videos, -> { distinct }, through: :relation_adds, source: :video

  has_many :relation_likes
  has_many :like_videos, -> { distinct }, through: :relation_likes, source: :video


  def add_video?(video_id)
    add_videos.exists?(id: video_id)
  end

  def add_video(video_id, from_user_id)
    unless add_video?(video_id)
      relation_adds.create!(video_id: video_id, from_user_id: from_user_id)
      #Notification.send_to(from_user_id).add(pin_id, self.id) unless from_user_id == self.id
    end
  end

  def revoke_add_video(video_id)
    user.add_videos.where(id: video_id).destroy_all
  end

  def like_video?(video_id)
    like_videos.exists?(id: video_id)
  end

  def like_video(video_id)
    unless like_video?(video_id)
      relation_likes.create!(video_id: video_id)
    end
  end

  def revoke_like_video(video_id)
    user.like_videos.where(id: video_id).destroy_all
  end

end

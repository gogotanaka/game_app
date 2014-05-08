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

  has_many :notifications, dependent: :destroy
  has_many :send_notifications, foreign_key: "from_user_id", class_name: "Notification", dependent: :destroy

  has_many :comments

  has_many :videos

  def follow_user?(user_id)
    follows.exists?(id: user_id)
  end

  def follow_user(user_id)
    unless follow_user?(user_id) || id == user_id
      relation_user_follows.create!(follow_id: user_id)
    end
  end

  def revoke_follow_user(user_id)
    relation_user_follows.where(follow_id: user_id).destroy_all
  end

  def add_video?(video_id)
    add_videos.exists?(id: video_id)
  end

  def add_video(video_id, from_user_id)
    unless add_video?(video_id)
      relation_adds.create!(video_id: video_id, from_user_id: from_user_id)
      send_notifications.create(user_id: from_user_id, video_id: video_id, kind: :add)
    end
  end

  def revoke_add_video(video_id)
    relation_adds.where(video_id: video_id).destroy_all
    send_notifications.where(video_id: video_id, kind: :add).destroy_all
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
    relation_likes.where(video_id: video_id).destroy_all
  end

end

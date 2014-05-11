module ApplicationHelper
  def add_info(add_user, from_user=nil)
    if !from_user || add_user == from_user
      "#{user_link(add_user)} が追加しました。"
    else
      "#{user_link(add_user)}が#{user_link(from_user)}から追加しました。"
    end
  end

  def user_link(user)
    link_to (user == current_user ? 'あなた' : user.email), profile_user_path(user)
  end
end

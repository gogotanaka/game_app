class UsersController < ApplicationController
  before_action :set_user, only: [:follows, :followers, :profile, :likes, :edit]

  before_action :authenticate_user, only: [:edit]
  def follows
  end

  def followers
  end

  def profile
  end

  def likes
  end

  def edit
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def authenticate_user
      unless current_user && current_user == @user
        redirect_to root_path
      end
    end
end

class UsersController < ApplicationController
  before_action :set_user, only: [:follows, :followers, :profile, :likes, :edit, :update, :follow, :unfollow]

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

  def follow
    current_user.follow_user(@user.id)
    redirect_to :back
  end

  def unfollow
    current_user.revoke_follow_user(@user.id)
    redirect_to :back
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to profile_user_path(@user), notice: 'video was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:contents, :name, :image)
    end

    def authenticate_user
      unless current_user && current_user == @user
        redirect_to root_path
      end
    end
end

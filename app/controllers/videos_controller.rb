class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy, :add, :revoke_add, :like, :revoke_like, :post_comment]

  def new
    service = Scraper::Service.new(params[:urls])
    @video_infos = service.execute
    @video = Video.new
  end

  def show
    @video.view += 1
    @video.save
  end

  def edit
    service = Scraper::Service.new([@video.movies.first.url])
    @video_infos = service.execute
  end

  def create
    @video = current_user.videos.new(video_params)
    movies = movie_params_ary.map do |movie_params|
      movie = Movie.new(movie_params)
    end
    respond_to do |format|
      if @video.save
        movies.each do |movie|
          movie.video_id = @video.id
          movie.save
        end
        format.html { redirect_to @video, notice: 'video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to video_url }
      format.json { head :no_content }
    end
  end

  def add
    current_user.add_video(@video.id, 1)
    redirect_to :back
  end

  def revoke_add
    current_user.revoke_add_video(@video.id)
    redirect_to :back
  end

  def like
    current_user.like_video(@video.id)
    redirect_to :back
  end

  def revoke_like
    current_user.revoke_like_video(@video.id)
    redirect_to :back
  end

  def post_comment
    current_user.post_comment(@video.id, params[:contents])
    redirect_to :back
  end

  def revoke_comment
    current_user.revoke_comment(params[:comment_id])
    redirect_to :back
  end

  def search
    @videos = Video.all
  end

  def popular
    @videos = Video.all
  end

  def everything
    @videos = Video.all
  end

  private

    def set_video
      @video = Video.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:title, :contents, :image, :tag_tokens)
    end

    def movie_params_ary
      movie_params_ary = []
      params.require(:video_infos).each do |_, movie_param|
        movie_params_ary << movie_param
        #permit(:iframe, :image_url, :url)
      end
      movie_params_ary
    end

end

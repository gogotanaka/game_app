class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  def new
    service = Scraper::Service.new(params[:urls])
    @video_infos = service.execute
    @video = Video.new
  end

  def show
  end

  def edit
  end

  def create
    @video = Video.new(video_params)
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

  private

    def set_video
      @video = Video.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:title)
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

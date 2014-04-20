class VideosController < ApplicationController
  def new
    service = Scraper::Service.new(params[:urls])
    service.execute
  end

  def show
  end

  def edit
  end
end

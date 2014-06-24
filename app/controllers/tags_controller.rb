class TagsController < ApplicationController
  def index
    query = params[:q] || ""
    @tags = Tag.where("name like ?", "%#{query}%")
    if @tags.empty?
      @tags = [{id: "<<<#{query}>>>", name: "New: \"#{query}\""}]
    else
      @tags
    end
  end

  def show
    @tag = Tag.find(params[:id])
    @videos = @tag.videos
  end
end

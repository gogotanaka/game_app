class TagsController < ApplicationController
  def index
    query = params[:q] || ""
    @tags = Tag.where("name like ?", "%#{query}%")
    if @tags.empty?
      [{id: "<<<#{query}>>>", name: "New: \"#{query}\""}]
    else
      @tags
    end
  end
end

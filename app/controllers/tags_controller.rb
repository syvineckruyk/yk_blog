class TagsController < ApplicationController
def index
  @tags = Tag.find(:all)
end
def show
  @tag = Tag.find(params[:id])
  @title = "Posts tagged with '#{@tag.name}'"
  @posts = @tag.taggings.collect { |t| t.taggable }
end
end
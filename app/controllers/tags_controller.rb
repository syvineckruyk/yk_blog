class TagsController < ApplicationController
def index
  @title = "Tags"
  @tags = Tag.find(:all)
end
def show
  @tag = Tag.find(params[:id])
  @title = "Posts tagged with '#{@tag.name}'"
  @posts = @tag.taggings.collect { |t| t.taggable }
  @posts = @posts.paginate( :page => params[:page], :per_page => 5)
  render(:template => 'posts/index')
end
end
class PostsController < ApplicationController
  # GET /posts
  # GET /posts.xml
uses_tiny_mce
  def index
    @title = "Posts"
    #@posts = Post.all(:order => "id DESC")
    @posts = Post.paginate :page => params[:page], :order => 'created_at DESC'
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])
    #@post = @post.paginate
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end
  # GET /posts/new
  # GET /posts/new.xml
  def new
    if signed_in?
      @post = Post.new
      respond_to do |format|
          format.html # new.html.erb
          format.xml  { render :xml => @post }
      end
    end
  end

  # GET /posts/1/edit
  def edit
    if signed_in?
      @post = Post.find(params[:id])
    end
  end

  # POST /posts
  # POST /posts.xml
  def create
    if signed_in?
      @post = Post.create( params[:post] )
      respond_to do |format|
        if @post.save
          format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
          format.xml  { render :xml => @post, :status => :created, :location => @post }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    if signed_in?
      @post = Post.find(params[:id])
        respond_to do |format|
        if @post.update_attributes(params[:post])
          format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    if signed_in?
      @post = Post.find(params[:id])
      @post.destroy
      respond_to do |format|
        format.html { redirect_to(posts_url) }
        format.xml  { head :ok }
      end
    end
  end
end

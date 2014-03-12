class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:noticia, :show]

  # GET /posts
  # GET /posts.json
  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
    @posts = Post.all
     respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    @og_description = @post.description
    @og_title = @post.title

    if @post.small_picture.url(:face) != "/small_pictures/face/missing.png"
      @og_image = @post.small_picture.url(:face)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  def noticia
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    render layout: 'admin'
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])

    render layout: 'admin'
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end

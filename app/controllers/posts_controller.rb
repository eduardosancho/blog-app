class PostsController < ApplicationController
  def index
    @page_title = 'Posts Index'
    @user_id = params[:user_id]
    @user = User.find(@user_id)
    @posts = @user.posts
  end

  def show
    @page_title = 'Post Details'
    @user_id = params[:user_id]
    @user = User.find(@user_id)
    @post_id = params[:id]
    @post = Post.find(@post_id)
  end

  def new
    @page_title = 'Create New Post'
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: post } }
    end
  end

  def create
    print 'Hola'
  end
end

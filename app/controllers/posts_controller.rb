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
end

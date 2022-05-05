class PostsController < ApplicationController
  def index
    @user_id = params[:user_id]
    @user = User.find(@user_id)
    @posts = @user.posts
  end

  def show
    @user_id = params[:user_id]
    @user = User.find(@user_id)
    @post_id = params[:id]
    @post = Post.find(@post_id)
  end
end

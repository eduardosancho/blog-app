class UsersController < ApplicationController
  def index
    @page_title = 'Users Index'
    @users = User.all
  end

  def show
    @page_title = 'User Profile'
    @user_id = params[:id]
    @user = User.find(@user_id)
    @posts = @user.recent_posts
  end
end

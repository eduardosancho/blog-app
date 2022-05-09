class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @page_title = 'Users Index'
    @users = User.all
  end

  def show
    @page_title = 'User Profile'
    @user_id = params[:id]
    @user = User.includes(:posts).find(@user_id)
  end
end

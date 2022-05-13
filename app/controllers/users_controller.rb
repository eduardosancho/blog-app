class UsersController < ApplicationController
  def index
    @page_title = 'Users Index'
    @users = User.all
  end

  def show
    @page_title = 'User Profile'
    @user_id = params[:id]
    @user = User.includes(:posts).find(@user_id)
    respond_to do |format|
      format.html
      format.json { render json: @user.to_json(include: [:posts]) }
    end
  end
end

class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
     @users = User.all 
     render json: @users
  end

  def show
    render json: @user.to_json(include: [:posts])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
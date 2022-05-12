class Api::V1::UsersController < ApplicationController
  before_action :set_user

  def show
    render json: @user.to_json(include: [:posts])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
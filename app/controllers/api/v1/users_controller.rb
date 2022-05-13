class Api::V1::UsersController < ApiController
  # before_action :set_user, only: [:show]
  # before_action :authenticate_user!

  def index
    @users = User.all
    render json: @users
  end

  def show
    # render json: @user
    # maybe should be empty
  end

  def update
    if current_user.update_attributes(user_params)
      render :show
    else
      render json: { errors: current_user_errors }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :bio, :photo)
  end
end

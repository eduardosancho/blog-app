class Api::V1::RegistrationsController < Devise::RegistrationsController
  protect_from_forgery with: :null_session
  before_action :sign_up_params, only: :create
  skip_before_action :verify_authenticity_token, only: :create

  def create
    @user = User.new(sign_up_params)
    @user.skip_confirmation!
    if @user.save
      render json: {
        messages: 'Sign Up Successfully',
        is_success: true,
        data: {}
      }, status: :ok
    else
      render json: {
        messages: 'Sign Up Failed',
        is_success: false,
        data: {}
      }, status: :unprocessable_entity
    end
  end

  private

  def sign_up_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end

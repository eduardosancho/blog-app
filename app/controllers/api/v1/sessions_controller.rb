class Api::V1::SessionsController < Devise::SessionsController
  protect_from_forgery with: :null_session
  before_action :sign_in_params, only: :create
  before_action :load_user, only: :create
  skip_before_action :verify_authenticity_token, only: :create

  def create
    # user = User.find_by_email(sign_in_params[:email])

    if @user&.valid_password?(sign_in_params[:password])
      @current_user = @user
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end

  private

  def sign_in_params
    params.require(:user).permit :email, :password
  end

  def load_user
    @user = User.find_for_database_authentication(email: sign_in_params[:email])
    @user || render(json: {
                      messages: 'Cannot get User',
                      is_success: false,
                      data: {}
                    }, status: :failure)
  end
end

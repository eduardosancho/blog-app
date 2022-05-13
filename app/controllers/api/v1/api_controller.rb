class Api::V1::ApiController < ApplicationController
  before_action :set_default_format
  before_action :authenticate_user

  private

  def set_default_format
    request.format = json
  end

  def authenticate_user!(_options = {})
    head :unauthorized unless signed_in?
  end

  def current_user
    @current_user ||= super || User.find(@current_user_id)
  end

  def signed_in?
    @current_user_id.present?
  end
end

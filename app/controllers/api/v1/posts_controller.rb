class Api::V1::PostsController < ApiController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    render json: @user.to_json(include: [:posts])
  end
end

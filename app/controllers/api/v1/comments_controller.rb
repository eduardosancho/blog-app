class Api::V1::CommentsController < ApiController
  before_action :set_post
  before_action :set_post_comment, only: %i[show update destroy]

  def index
    render json: @post.to_json(include: [:comments])
  end

  def create
    @post.comments.create!(comment_params)
    json_response(@post, :created)
  end

  private

  def comment_params
    params.permit(:text)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_post_comment
    @comment = @post.comments.find(params[:id]) if @post
  end
end

class Api::V1::CommentsController < ApiController
  before_action :set_post
  before_action :set_post_comment, only: %i[show update destroy]
  

  def index
    render json: @post.to_json(include: [:comments])
  end

  def create

    @post = Post.find_by(id: params[:post_id])

    @comment = Comment.new(comment_params(post_id: @post.id))

    if @comment.save
      @current_user = user 
    else
      render json: {
        messages: 'Comment not created',
        is_success: false,
        data: {}
      }, status: :unprocessable_entity
    end

    @post.comments.create!(comment_params)
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

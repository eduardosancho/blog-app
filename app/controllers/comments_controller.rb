class CommentsController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token, only: :create
  before_action :load_comment_owner_post, only: :create

  load_and_authorize_resource
  layout 'posts'

  def new
    @page_title = 'Create New Comment'
    comment = Comment.new
    author_id = params[:user_id]
    @author = User.find(author_id)
    post_id = params[:post_id]
    post = Post.find(post_id)
    respond_to do |format|
      format.html { render :new, locals: { comment: comment, author: @author, post: post } }
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = User.find(3).id
    @comment.post_id = @post.id
    respond_to do |format|
      format.html do
        if @comment.save
          flash[:success] = 'Comment saved succesfully'
          redirect_to user_post_url(@owner, @post)
        else
          flash[:error] = 'Error: Comment could not be saved'
          redirect_to new_user_post_comment_url(@owner, @post)
        end
      end
      format.json do
        unless @comment.save
          render json: { messages: 'Comment not created', is_success: false, data: {} },
                 status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy

    flash[:success] = 'Comment has been deleted successfully'
    redirect_to user_post_path(params[:user_id], params[:post_id]), status: :see_other
  end

  private

  def load_comment_owner_post
    @owner = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end

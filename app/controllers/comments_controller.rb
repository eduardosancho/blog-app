class CommentsController < ApplicationController
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
    @owner = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]
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
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy

    flash[:success] = 'Comment has been deleted successfully'
    redirect_to user_post_path(params[:user_id], params[:post_id]), status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

class CommentsController < ApplicationController
  def new
    @page_title = 'Create New Comment'
    comment = Comment.new
    author_id = params[:user_id]
    author = User.find(author_id)
    post_id = params[:post_id]
    post = Post.find(post_id)
    respond_to do |format|
      format.html { render :new, locals: { comment: comment, author: author, post: post } }
    end
  end

  def create
    owner = User.find(params[:user_id])
    post = Post.find(params[:post_id])
    comment = Comment.new(params.require(:comment).permit(:text))
    comment.author_id = current_user.id
    comment.post_id = params[:post_id]
    respond_to do |format|
      format.html do
        if comment.save
          redirect_to user_post_url(owner, post)
          flash[:success] = 'Comment saved succesfully'
        else
          flash[:error] = 'Error: Comment could not be saved'
          redirect_to new_user_post_comment_url(owner, post)
        end
      end
    end
  end
end

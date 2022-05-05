class CommentsController < ApplicationController
  def new
    @page_title = 'Create New Comment'
    comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: comment }}
    end
  end

  def create
  end
end

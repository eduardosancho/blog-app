class LikesController < ApplicationController
  def create
    owner = User.find(params[:user_id])
    post = Post.find(params[:post_id])
    @like = Like.new
    @like.author_id = current_user.id
    @like.post_id = params[:post_id]
    respond_to do |format|
      format.html do
        if @like.save
          flash[:success] = 'Like saved succesfully'
        else
          flash[:error] = 'Error: Like could not be saved'
        end
      end
    end
  end
end

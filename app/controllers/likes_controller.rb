class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])

    if @post.liked?(current_user)
      flash[:error] = 'Error: You already liked this post'
      redirect_to user_post_url(@user, @post)
      return
    end

    @like = Like.new
    @like.author_id = current_user.id
    @like.post_id = params[:post_id]
    respond_to do |format|
      format.html do
        if @like.save
          redirect_to user_post_url(@user, @post)
          flash[:success] = 'Like saved succesfully'
        end
      end
    end
  end
end

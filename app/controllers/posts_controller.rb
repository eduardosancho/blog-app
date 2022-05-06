class PostsController < ApplicationController
  def index
    @page_title = 'Posts Index'
    @user_id = params[:user_id]
    @user = User.find(@user_id)
    @posts = @user.posts
  end

  def show
    @page_title = 'Post Details'
    @user_id = params[:user_id]
    @user = User.find(@user_id)
    @post_id = params[:id]
    @post = Post.find(@post_id)
  end

  def new
    @page_title = 'Create New Post'
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: post } }
    end
  end

  def create
    post = Post.new(params.require(:post).permit(:title, :text))
    post.author_id = current_user.id
    respond_to do |format|
      format.html do
        if post.save
          redirect_to user_posts_url(current_user)
          flash[:success] = 'Post saved succesfully'
        else
          flash[:error] = 'Error: Post could not be saved'
          redirect_to new_user_post_url(current_user)
        end
      end
    end
  end
end

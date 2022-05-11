class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @page_title = 'Posts Index'
    author_id = params[:user_id]
    @author = User.includes(:posts, posts: [:comments, { comments: [:author] }]).find(author_id)
  end

  def show
    authorize! :read, @post
    @page_title = 'Post Details'
    post_id = params[:id]
    @post = Post.includes(:comments, comments: [:author]).find(post_id)
    @author = @post.author
  end

  def new
    @author = current_user
    @page_title = 'Create New Post'
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: post } }
    end
  end

  def create
    post = Post.new(post_params)
    post.author_id = current_user.id
    respond_to do |format|
      format.html do
        if post.save
          flash[:success] = 'Post saved succesfully'
          redirect_to user_posts_url(current_user)
        else
          flash[:error] = 'Error: Post could not be saved'
          redirect_to new_user_post_url(current_user)
        end
      end
    end
  end

  def destroy
    post = Post.find(params[:id])
    authorize! :manage, post
    post.destroy

    flash[:success] = 'Post has been deleted successfully'
    redirect_to user_posts_path(post.author.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

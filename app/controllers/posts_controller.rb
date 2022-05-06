class PostsController < ApplicationController
  def index
    @page_title = 'Posts Index'
    author_id = params[:user_id]
    @author = User.includes(:posts, posts: [:comments, { comments: [:author] } ]).find(author_id)
  end

  def show
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

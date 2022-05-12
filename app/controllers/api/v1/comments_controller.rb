class Api::V1::CommentsController < ApplicationController

  def index
    @post = Post.find(params[:post_id])
    render json: @post.to_json(include: [:comments])
  end
  
end
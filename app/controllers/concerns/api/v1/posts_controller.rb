class Api::V1::PostsController < ApplicationController

  def index
    posts = Post.all
    render json: posts, each_serializer: PostSerializer
  end

  def show
    posts = Post.find(params[:id])
    render json: posts, serializer: PostSerializer
  end
end
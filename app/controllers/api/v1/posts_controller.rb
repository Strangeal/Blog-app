class Api::V1::PostsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    post = user.posts
    render json: post
  end

  def show
    @user = User.find(params[:user_id])
    @posts = Post.find(params[:id])
    @comments = @posts.comments.includes([:author])
    render json: @comments
  end
end

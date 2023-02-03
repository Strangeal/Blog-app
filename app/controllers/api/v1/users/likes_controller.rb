class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.new(post_id: params[:id], author: current_user)
    @like.save
    redirect_to user_post_path(current_user.id, params[:id])
  end
end

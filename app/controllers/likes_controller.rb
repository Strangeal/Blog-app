class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.new(post_id: params[:id], author: current_user)
    if @like.save
      redirect_to root_path, notice: 'Post liked'
    else
      render :new, alert: 'An error occured. Please try again'
    end
  end
end

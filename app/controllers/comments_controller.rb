class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(text: params[:text], author: current_user, post_id: params[:id])
    p @comment
    if @comment.save
      redirect_to root_path, notice: "comment posted successfully"
    else
      render :new, alert: "Field to post comment. Please try again"
    end
  end
  
end
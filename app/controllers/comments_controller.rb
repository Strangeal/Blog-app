class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(text: params[:text], author: current_user, post_id: params[:id])
    p params
    if @comment.save
      redirect_to users_next_post_path(current_user.id, @comment.post_id), notice: 'comment posted successfully'
    else
      render :new, alert: 'Field to post comment. Please try again'
    end
  end
end

class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.post_id = params[:id]
    if @comment.save
      redirect_to users_next_post_path(current_user.id, @comment.post_id), notice: 'comment posted successfully'
    else
      render :new, alert: 'Field to post comment. Please try again'
    end
  end

  private

  def comment_params
    params.permit(:text)
  end
end

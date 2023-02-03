class Api::V1::CommentsController < ApplicationController

  def index
    comment = Comment.all.where(author_id: params[:user_id], post_id: params[:post_id]).includes(:author)
    render json: comment
  end

  def create
    comment = Comment.new(comment_params)
    comment.author = current_user
    comment.post_id = params[:post_id]
    if comment.save
      render json: comment, status: :created
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.permit(:text)
  end
end
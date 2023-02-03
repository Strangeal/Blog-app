class Api::V1::PostsController < ApplicationController
  def index
      user = User.includes(:posts).find(params[:user_id])
      render json: user
  end
end
class PostsController < ApplicationController
  def index
    @user = User.includes(:posts).find(params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    if @post.save
      redirect_to user_path(current_user.id), notice: 'Post saved'
    else

      render :new, alert: 'An error occured'
    end
  end

  def show
    @user = User.find(params[:user_id])
    @posts = Post.find(params[:id])
    @comments = @posts.comments.includes([:author])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(params[:user_id]), notice: 'Post deleted Successfully'
  end

  private

  def post_params
    params.require(:post).permit(:author, :title, :text)
  end
end

class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
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
    @comments = Comment.where(post_id: params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:author, :title, :text)
  end
end

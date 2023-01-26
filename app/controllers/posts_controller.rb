class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(author: current_user, title: params[:post][:title], text: params[:post][:text])
    if @post.save
      redirect_to users_posts_path(current_user.id), notice: 'Post saved'
    else

      render :new, alert: 'An error occured'
    end
  end

  def show
    @user = User.find(params[:user_id])
    @posts = Post.find(params[:id])
    @comments = Comment.where(post_id: params[:id])
  end
end

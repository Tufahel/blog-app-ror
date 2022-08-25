class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments, :likes)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @likes = @post.likes
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)

    if @post.save
      redirect_to user_path(id: @post.author_id)
    else
      render :new, alert: 'An error occured'
    end
  end

  def destroy
    @author = User.find(params[:user_id])
    @post = @author.posts.find(params[:id])
    @post.destroy
    if @post.destroy
      redirect_to user_path(params[:user_id])
    else
      redirect_to user_posts_path(params[:user_id], params[:id])
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

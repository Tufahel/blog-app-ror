class Api::PostsController < ApplicationController
  include Response
  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @likes = @post.likes
    render json: @post
  end

  def new
    @post = Post.new
    render json: @post, status: :ok
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)

    if @post.save
      render json: @post
    else
      render json: @post.errors.full_messages, status: 422
    end
  end

  def destroy
    @author = User.find(params[:user_id])
    @post = @author.posts.find(params[:id])
    @post.destroy
    render json: @post
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

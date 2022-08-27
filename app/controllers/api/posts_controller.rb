class Api::PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    render json: @posts
  end
  def show
    @user = User.find(params[:user_id])
    @posts = @user.posts.find(params[:id])
    render json: @posts
  end
end
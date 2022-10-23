class Api::LikesController < ApplicationController
  def index
    @likes = Like.all
    render json: @likes
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = Like.create(
      author_id: @user.id,
      post_id: @post.id
    )

    render json: @like
  end
end

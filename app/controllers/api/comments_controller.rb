class Api::CommentsController < ApplicationController
  def index
    @comments = Comment.all
    render json: @comments
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.create(
      text: comment_params[:text],
      author_id: @user.id,
      post_id: @post.id
    )

    render json: @comment
  end

  def destroy
    puts params
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    render json: @comment
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

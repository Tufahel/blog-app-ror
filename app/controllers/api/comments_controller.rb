class Api::CommentsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comments = @post.comments
    render json: @comments
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.author_id = current_user.id
    @comment.post_id = @post.id

    if @comment.save
      redirect_to user_post_path(author_id: @post.author_id, id: @post.id)
      render json: @comment
    else
      render :new, alert: 'An error occured'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

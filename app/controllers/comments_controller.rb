class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.author_id = current_user.id
    @comment.post_id = @post.id

    if @comment.save
      redirect_to user_post_path(author_id: @post.author_id, id: @post.id)
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

  def comment_params
    params.require(:comment).permit(:text)
  end
end

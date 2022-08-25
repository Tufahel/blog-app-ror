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
    puts params
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      redirect_to user_post_url
    else
      redirect_to user_posts_url
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

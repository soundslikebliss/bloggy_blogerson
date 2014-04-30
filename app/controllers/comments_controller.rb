class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
  
  
    private
    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:commenter, :body, :user_id, :name)
    end
  
end

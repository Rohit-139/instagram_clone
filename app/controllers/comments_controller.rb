class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
 
    if @comment.save 
      redirect_to posts_path
    end
  end


  

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to posts_path
  end

  private 

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end

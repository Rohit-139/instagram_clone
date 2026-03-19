class LikesController < ApplicationController
  def create
    @likeable = find_likeable
    @like = @likeable.likes.new(user: current_user)

    if @like.save
      redirect_to posts_path
    else
      redirect_to posts_path, alert: "Unable to like."
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to posts_path
  end

   private

  def find_likeable
    params[:like][:post_id] ? Post.find(params[:like][:post_id]) : Comment.find(params[:like][:comment_id])
  end
end

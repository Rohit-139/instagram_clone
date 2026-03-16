class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:edit, :update, :destroy]
  def index
  end

  def new 
    @post = Post.new
  end

  def create 
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save 
  end

  def edit 
  end

  def update 
    @post.update(post_params)
  end

  def destroy 
    @post.destroy
  end


  private 
  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [ :edit, :update, :destroy ]

  def index
    @posts = Post.where.not(user: current_user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
     if @post.save
       redirect_to posts_path
     else
      render :new, status: :unprocessable_entity
     end
  end

  def edit
  end

  def update
   if @post.update(post_params)
      redirect_to post_page_path
   else
      render :edit, status: :unprocessable_entity
   end
  end

  def destroy
    @post.destroy
    redirect_to post_page_path
  end


  def post_page
    @posts = current_user.posts
  end


  private
  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end

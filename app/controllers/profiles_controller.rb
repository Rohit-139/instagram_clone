class ProfilesController < ApplicationController
  before_action :set_profile, only: [ :update, :show, :edit ]
  def show
    @posts = @profile.user.posts
  end

  def follow
    @follow = Follow.new
    @user = User.find(params[:id])
    @follow.follower = current_user
    @follow.followee = @user
    if @follow.save
      redirect_to profile_path(@user.profile.id)
    else
      render :show, unprocessable_entity
    end
  end


  def unfollow
    @user = User.find(params[:id])
    @follow = Follow.where(follower: current_user, followee: @user)
    @follow.destroy_all
    redirect_to profile_path(@user.profile.id)
  end

  def edit
  end

  def index
    follow = params[:follower]
      @user = User.find(params[:user])
    if follow == "true"
      @followers = @user.followers
    else
      @followers = @user.followees
    end
  end
  def update
    if @profile.update(profile_params)
      redirect_to profile_path(@profile)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :bio, :about, :avatar)
  end
end

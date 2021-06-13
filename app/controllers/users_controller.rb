class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id]) 
    @spots = @user.spots
  end

  def search
    @users = User.search(params[:keyword])
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.following
    # @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    # @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

end

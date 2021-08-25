class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :admin_user, only: :destroy
  
  def show
    @user = User.find(params[:id]) 
    @spots = @user.spots
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to root_url
  end

  def search
    @users = User.search(params[:keyword])
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end

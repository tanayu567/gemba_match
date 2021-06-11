class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id]) 
    @spots = @user.spots
  end

  def search
    @users = User.search(params[:keyword])
  end
  
end

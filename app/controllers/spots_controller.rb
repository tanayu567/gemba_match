class SpotsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :edit]
  
  def create
  end

  def destroy
  end

  def edit
  end

  def new
    @spot = Spot.new
  end

end

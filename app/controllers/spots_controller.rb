class SpotsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :edit]

  def show
    @spot = Spot.find(params[:id])
    @comment = Comment.new
    @comments = @spot.comments.includes(:user)
  end
  
  def create
    @spot = current_user.spots.build(spot_params)
    if @spot.save
      redirect_to root_url
    else
      render 'top/index'
    end
  end

  def destroy
    Spot.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])
    if @spot.update(spot_params)
      redirect_to spot_path(params[:id])
    else
      render :new
    end
  end

  def new
    @spot = Spot.new
  end

  def search
    @spots = Spot.search(params[:keyword])
  end
  

private

def spot_params
  params.require(:spot).permit(:s_name, :address, :start, :last, :money)
end



end

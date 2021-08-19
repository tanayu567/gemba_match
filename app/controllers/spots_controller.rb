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
  end

  def edit
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

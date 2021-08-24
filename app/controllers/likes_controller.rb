class LikesController < ApplicationController

  def create
    @spot = Spot.find(params[:spot_id])
    @like = current_user.likes.create(spot_id: params[:spot_id])
    # redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @spot = Spot.find(params[:spot_id])
    @like = current_user.likes.find_by(spot_id: @spot.id)
    @like.destroy
    # redirect_back(fallback_location: root_path)
  end
  
  
end
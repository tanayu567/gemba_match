class SpotsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :edit]
  
  def create
    @spot = current_user.spots.build(spot_params)
    if @spot.save
      flash[:success] = "工事現場を投稿しました"
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

private

def spot_params
  params.require(:spot).permit(:s_name, :address, :start, :last, :money)
end

end

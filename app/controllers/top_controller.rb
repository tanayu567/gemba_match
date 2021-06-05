class TopController < ApplicationController
  def index
    @spots = Spot.all
    @spot = current_user.spots.build if logged_in?
  end

end

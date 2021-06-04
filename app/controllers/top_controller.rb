class TopController < ApplicationController
  def index
    @spots = Spot.all
  end

end

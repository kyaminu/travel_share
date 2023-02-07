class SharedTripsController < ApplicationController
  def show
    @trip = Trip.find_by(share_key: params[:h])
    render 'trips/show'
  end
end

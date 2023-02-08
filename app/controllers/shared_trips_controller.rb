class SharedTripsController < ApplicationController
  skip_before_action :authenticate_user, only: %i[ show ]
  
  def show
    @trip = Trip.find_by(share_key: params[:h])
    render 'trips/show'
  end
end

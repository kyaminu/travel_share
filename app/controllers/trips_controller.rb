class TripsController < ApplicationController
  before_action :set_trip, only: %i[ show destroy ]

  # GET /trips
  def index
    @trips = current_user.trips.order("created_at DESC")
  end

  # GET /trips/new
  def new
    @trip = current_user.trips.new
  end

  # POST /trips
  def create
    @trip = current_user.trips.new(trip_params)
    if @trip.save
      TripUser.create(user_id: current_user.id, trip_id: @trip.id)
      trips_by_place = @trip.recommended_trips[trip_params[:name]]
      (1..trip_params[:day].to_i).each do |day|
        trips_by_place[day.to_s].each do |trip_content|
          @trip.trip_contents.create!(
            timestamp: "#{@trip.when + day - 1} #{trip_content[:timestamp]}",
            content: trip_content[:content]
          )
        end
      end
      redirect_to @trip, notice: "旅程を作成しました"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  # GET /trips/1
  def show
    @trip_content = @trip.trip_contents.build
  end

  # DELETE /trips/1
  def destroy
    @trip.destroy!
    redirect_to trips_url, notice: "旅程を削除しました"
  end

  def share
    @trip = Trip.find(params[:id])
    @trip.share_key = Digest::SHA1.hexdigest(Time.now.to_s)
    @trip.save!
    redirect_to @trip
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = current_user.trips.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trip_params
      params.require(:trip).permit(:name,:day,:name_of_trip,:when)
    end
end

class TripsController < ApplicationController
  before_action :set_trip, only: %i[ show destroy share]

  # GET /trips
  def index
    @trips = current_user.trips.order(start_at: :DESC)
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
      trips_by_place = @trip.recommended_trips[trip_params[:destination]]
      day = trip_params[:day].to_i
      day = 3 if day > 3
      (1..day).each do |day|
        trips_by_place[day.to_s].each do |trip_content|
          @trip.trip_contents.create!(
            scheduled_time: "#{@trip.start_at + day - 1} #{trip_content[:scheduled_time]}",
            schedule: trip_content[:schedule]
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
  end

  # DELETE /trips/1
  def destroy
    @trip.destroy!
    redirect_to trips_url, notice: "旅程を削除しました"
  end

  def share
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
      params.require(:trip).permit(:destination,:day,:title,:start_at)
    end
end

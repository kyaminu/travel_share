class TripsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trip, only: %i[ show edit update destroy ]

  # GET /trips
  def index
    @trips = current_user.trips.order("created_at DESC")
  end

  # GET /trips/1
  def show
    @trip_content = @trip.trip_contents.build
    
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
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
            timestamp: trip_content[:timestamp],
            content: trip_content[:content]
          )
        end
      end
      redirect_to @trip, notice: "旅程を作成しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trips/1
  def update
    if @trip.update(trip_params)
      redirect_to @trip, notice: "旅程を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /trips/1
  def destroy
    @trip.destroy
    redirect_to trips_url, notice: "旅程を削除しました"
  end
  
  def share
    @trip = Trip.new(params[:trip])
    @trip.share_key  = Digest::SHA1.hexdigest(Time.now.to_s) 。
    @schedule.save
    redirect_to @trip
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trip_params
      params.require(:trip).permit(:name,:day,:name_of_trip,:when,:total_day)
    end
end

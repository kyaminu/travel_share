class TripContentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trip_content, only: %i[ show edit update destroy ]
  before_action :set_trip, only: %i[ new create edit update]

  # GET /trip_contents
  # def index
  # end

  # GET /trip_contents/1
  def show
  end

  # GET /trip_contents/new
  def new
  end

  # GET /trip_contents/1/edit
  def edit
  end

  # POST /trip_contents
  def create
    # @trip_content = TripContent.new(trip_content_params)
    # @trip_content.trip_id = @trip.id
    #上２行は、下１行にまとめられる
    @trip_content = @trip.trip_contents.build(trip_content_params)
    if @trip_content.save
      redirect_to trip_path(@trip.id), notice: "Trip content was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trip_contents/1
  def update
    if @trip_content.update(trip_content_params)
      redirect_to trip_path(@trip.id), notice: "Trip content was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /trip_contents/1
  def destroy
    @trip_content.destroy

    redirect_to @trip_content.trip, notice: "Trip content was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip_content
      @trip_content = TripContent.find(params[:id])
    end
    
    def set_trip
      @trip = Trip.find(params[:trip_id])
    end
    
    # Only allow a list of trusted parameters through.
    def trip_content_params
      params.require(:trip_content).permit(:timestamp, :content, :trip_id)
    end
end

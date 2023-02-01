class TripContentsController < ApplicationController
  before_action :set_trip_content, only: %i[ show edit update destroy ]

  # GET /trip_contents
  def index
    @trip_contents = TripContent.all
  end

  # GET /trip_contents/1
  def show
  end

  # GET /trip_contents/new
  def new
    @trip_content = TripContent.new
  end

  # GET /trip_contents/1/edit
  def edit
  end

  # POST /trip_contents
  def create
    trip = Trip.find(params[:trip_id])
    # @trip_content = TripContent.new(trip_content_params)
    # @trip_content.trip_id = trip.id
    @trip_content = trip.trip_contents.build(trip_content_params)
    if @trip_content.save
      # trip = Trip.trip_contents()
      # TripContent.create(trip_id: )
      redirect_to trip_trip_content_path(@trip_content), notice: "Trip content was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trip_contents/1
  def update
    if @trip_content.update(trip_content_params)
      redirect_to trip_trip_content_path, notice: "Trip content was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /trip_contents/1
  def destroy
    @trip_content.destroy
    redirect_to trip_contents_url, notice: "Trip content was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip_content
      @trip_content = TripContent.find(params[:id])
    end
    
    

    # Only allow a list of trusted parameters through.
    def trip_content_params
      params.require(:trip_content).permit(:timestamp, :content, :trip_id)
    end
end

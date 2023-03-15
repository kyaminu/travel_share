class TripContentsController < ApplicationController
  before_action :set_trip_content, only: %i[ edit update destroy ]
  before_action :set_trip, only: %i[ create ]

  # GET /trip_contents/new
  def new
  end

  # POST /trip_contents
  def create
    # @trip_content = TripContent.new(trip_content_params)
    # @trip_content.trip_id = @trip.id
    #上２行は、下１行にまとめられる
    @trip_content = @trip.trip_contents.build(trip_content_params)
    if @trip_content.save
      redirect_to trip_path(@trip.id), notice: "予定を作成しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /trip_contents/1/edit
  def edit
  end

  # PATCH/PUT /trip_contents/1
  def update
    if @trip_content.update(trip_content_params)
      redirect_to trip_path(@trip.id), notice: "予定を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /trip_contents/1
  def destroy
    @trip_content.destroy!
    redirect_to @trip_content.trip, notice: "予定を削除しました"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip_content
      set_trip
      @trip_content = @trip.trip_contents.find(params[:id])
    end
    
    def set_trip
      @trip = current_user.trips.find(params[:trip_id])
    end
    
    # Only allow a list of trusted parameters through.
    def trip_content_params
      params.require(:trip_content).permit(:scheduled_time, :schedule, :trip_id)
    end
end
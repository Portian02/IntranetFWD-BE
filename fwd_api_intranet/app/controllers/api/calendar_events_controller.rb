class Api::CalendarEventsController < ApplicationController
  before_action :set_calendar_event, only: %i[ show update destroy ]
  # GET /tasks
  def index
    @calendar_event = CalendarEvent.all

    render json: @calendar_event
  end

  # GET /tasks/1
  def show
    render json: @calendar_event
  end

  # POST /tasks
  def create
    @calendar_event = CalendarEvent.new(calendar_event_params)

    if @calendar_event.save
      render json: @calendar_event, status: :created
    else
      render json: @calendar_event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @calendar_event.update(calendar_event_params)
      render json: @calendar_event
    else
      render json: @calendar_event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @calendar_event.destroy
     render json: {message: "calendar_event deleted successfully"}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calendar_event
      begin
        @calendar_event = CalendarEvent.find(params[:id])
      rescue => error
        Rails.logger.error("********** calendar_event not found **********")
        @error_message = {
          message: "calendar_event not found! the ID in not present in the database"
        }
        render json: @error_message, status: :not_found


      end

    end

    # Only allow a list of trusted parameters through.
    def calendar_event_params
      params.require(:calendar_event).permit(:title, :description, :url)
    end
end

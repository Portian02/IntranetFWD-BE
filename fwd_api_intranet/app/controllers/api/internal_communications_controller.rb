class Api::InternalCommunicationsController < ApplicationController
  before_action :set_internal_communication, only: %i[ show update destroy ]
  # GET /tasks
  def index
    @internal_communication = InternalCommunication.all

    render json: @internal_communication
  end

  # GET /tasks/1
  def show
    render json: @internal_communication
  end

  # POST /tasks
  def create
    @internal_communication = InternalCommunication.new(internal_communication_params)

    if @internal_communication.save
      render json: @internal_communication, status: :created
    else
      render json: @internal_communication.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @internal_communication.update(internal_communication_params)
      render json: @internal_communication
    else
      render json: @internal_communication.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @internal_communication.destroy
     render json: {message: "internal_communication deleted successfully"}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_internal_communication
      begin
        @internal_communication = InternalCommunication.find(params[:id])
      rescue => error
        Rails.logger.error("********** internal_communication not found **********")
        @error_message = {
          message: "internal_communication not found! the ID in not present in the database"
        }
        render json: @error_message, status: :not_found


      end

    end

    # Only allow a list of trusted parameters through.
    def internal_communication_params
      params.require(:internal_communication).permit(:title, :content, :date, :user_id)
    end
end

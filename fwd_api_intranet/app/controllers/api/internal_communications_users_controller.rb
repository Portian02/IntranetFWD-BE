class Api::InternalCommunicationsUsersController < ApplicationController
  before_action :set_internal_communication_user, only: %i[ show update destroy ]
  # GET /tasks
  def index
    @internal_communications_user = InternalCommunicationsUsers.all

    render json: @internal_communications_user
  end

  # GET /tasks/1
  def show
    render json: @internal_communications_user
  end

  # POST /tasks
  def create
    @internal_communications_user = InternalCommunicationsUsers.new(internal_communication_user_params)

    if @internal_communications_user.save
      render json: @internal_communications_user, status: :created
    else
      render json: @internal_communications_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @internal_communications_user.update(internal_communication_user_params)
      render json: @internal_communications_user
    else
      render json: @internal_communications_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @internal_communications_user.destroy
     render json: {message: "internal_communications_user deleted successfully"}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_internal_communication_user
      begin
        @internal_communications_user = InternalCommunicationsUsers.find(params[:id])
      rescue => error
        Rails.logger.error("********** internal_communications_user not found **********")
        @error_message = {
          message: "internal_communications_user not found! the ID in not present in the database"
        }
        render json: @error_message, status: :not_found


      end

    end

    # Only allow a list of trusted parameters through.
    def internal_communication_user_params
      params.require(:internal_communications_users).permit(:user_id, :internal_communication_id)
    end
end

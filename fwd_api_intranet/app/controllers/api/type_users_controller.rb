class Api::TypeUsersController < ApplicationController
  before_action :set_type_user, only: %i[ show update destroy ]
  #  before_action :auth_user, only: %i[ create update destroy ]
    # GET /tasks
    def index
      @type_user = TypeUser.all

      render json: @type_user
    end

    # GET /tasks/1
    def show
      render json: @type_user
    end

    # POST /tasks
    def create
      @type_user = TypeUser.new(type_user_params)

      if @type_user.save
        render json: @type_user, status: :created
      else
        render json: @type_user.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /tasks/1
    def update
      if @type_user.update(type_user_params)
        render json: @type_user
      else
        render json: @type_user.errors, status: :unprocessable_entity
      end
    end

    # DELETE /tasks/1
    def destroy
      @type_user.destroy
       render json: {message: "type_user deleted successfully"}, status: :ok
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_type_user
        begin
          @type_user = TypeUser.find(params[:id])
        rescue => error
          Rails.logger.error("********** type_user not found **********")
          @error_message = {
            message: "type_user not found! the ID in not present in the database"
          }
          render json: @error_message, status: :not_found


        end

      end

      # Only allow a list of trusted parameters through.
      def type_user_params
        params.require(:type_user).permit(:type_name, :description)
      end
  end

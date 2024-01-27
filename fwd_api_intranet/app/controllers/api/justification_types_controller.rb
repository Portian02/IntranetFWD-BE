class  Api::JustificationTypesController < ApplicationController
   
    before_action :set_justification_type, only: %i[ show update destroy ]
    #  before_action :auth_user, only: %i[ create update destroy ]
      # GET /tasks
      def index
        @justification_type = JustificationType.all
  
        render json: @justification_type
      end
  
      # GET /tasks/1
      def show
        render json: @justification_type
      end
  
      # POST /tasks
      def create
        @justification_type = JustificationType.new(justification_type_params)
  
        if @justification_type.save
          render json: @justification_type, status: :created
        else
          render json: @justification_type.errors, status: :unprocessable_entity
        end
      end
  
      # PATCH/PUT /tasks/1
      def update
        if @justification_type.update(justification_type_params)
          render json: @justification_type
        else
          render json: @justification_type.errors, status: :unprocessable_entity
        end
      end
  
      # DELETE /tasks/1
      def destroy
        @justification_type.destroy
         render json: {message: "justification_type deleted successfully"}, status: :ok
      end
  
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_justification_type
          begin
            @justification_type = JustificationType.find(params[:id])
          rescue => error
            Rails.logger.error("********** justification_type not found **********")
            @error_message = {
              message: "justification_type not found! the ID in not present in the database"
            }
            render json: @error_message, status: :not_found
  
  
          end
  
        end
  
        # Only allow a list of trusted parameters through.
        def justification_type_params
          params.require(:justification_type).permit(:name, :description)
        end
      

end

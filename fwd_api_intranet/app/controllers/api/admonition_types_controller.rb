class Api::AdmonitionTypesController < ApplicationController

        before_action :set_admonition_type, only: %i[ show update destroy ]
        #  before_action :auth_user, only: %i[ create update destroy ]
        # GET /tasks
        def index
            @admonition_type = AdmonitionType.all
    
            render json: @admonition_type
        end
    
        # GET /tasks/1
        def show
            render json: @admonition_type
        end
    
        # POST /tasks
        def create
            @admonition_type = AdmonitionType.new(admonition_type_params)
    
            if @admonition_type.save
            render json: @admonition_type, status: :created
            else
            render json: @admonition_type.errors, status: :unprocessable_entity
            end
        end
    
        # PATCH/PUT /tasks/1
        def update
            if @admonition_type.update(admonition_type_params)
            render json: @admonition_type

            else
            render json: @admonition_type.errors, status: :unprocessable_entity
            end
        end
    
        # DELETE /tasks/1
        def destroy
            @admonition_type.destroy
            render json: {message: "admonition_typedeleted successfully"}, status: :ok
        end
    
        private
            # Use callbacks to share common setup or constraints between actions.
            def set_admonition_type
            begin
                @admonition_type= AdmonitionType.find(params[:id])
            rescue => error
                Rails.logger.error("********** admonition_type not found **********")
                @error_message = {
                message: "admonition_type not found! the ID in not present in the database"
                }
                render json: @error_message, status: :not_found
    
    
            end
    
        end
    
            # Only allow a list of trusted parameters through.
            def admonition_type_params
            params.require(:admonition_type).permit(:name, :description)
        end
        
    end

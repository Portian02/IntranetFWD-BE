class Api::DocumentsTypesController < ApplicationController
   
        before_action :set_documents_type, only: %i[show edit update destroy]
        
            def index
            @documents_types = DocumentsType.all
            render json: @documents_types
            end
        
            def show
            render json: @documents_types
            end
        
            def create
            @documents_types = DocumentsType.new(documents_types_params)
        
            if @documents_types.save
                render json: @documents_types, status: :created
            else
                render json: @documents_types.errors, status: :unprocessable_entity
            end
            end
        
            def edit
            end
        
            def update
            if @documents_types.update(documents_types_params)
                render json: @documents_types, status: :ok
            else
                render json: @documents_types.errors, status: :unprocessable_entity
            end
            end
        
            def destroy
            @documents_types.destroy
            render json: {message: "internal_communication deleted successfully"}, status: :ok
            end
        
            private
        
            def set_documents_type
            @documents_types = DocumentsType.find(params[:id])
            end
        
            def documents_types_params
            params.require(:documents_types).permit(:type_name , :description)
            end
        end

        

class Api::DocumentsStoragesController < ApplicationController
    before_action :set_documents_storage, only: %i[show edit update destroy]

    def index
      @documents_storages = DocumentsStorage.all
      render json: @documents_storages
    end

    def show
      render json: @documents_storage
    end

    def create
      @documents_storage = DocumentsStorage.new(documents_storage_params)

      if @documents_storage.save
        render json: @documents_storage, status: :created
      else
        render json: @documents_storage.errors, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @documents_storage.update(documents_storage_params)
        render json: @documents_storage, status: :ok
      else
        render json: @documents_storage.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @documents_storage.destroy
     render json: {message: "internal_communication deleted successfully"}, status: :ok
    end

    private

    def set_documents_storage
      @documents_storage = DocumentsStorage.find(params[:id])
    end

    def documents_storage_params
      params.require(:documents_storage).permit(:name, :description, :url, :documents_type_id)
    end
  end

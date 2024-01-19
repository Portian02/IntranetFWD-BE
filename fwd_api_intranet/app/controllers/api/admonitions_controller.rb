# app/controllers/admonitions_controller.rb
class  Api::AdmonitionsController < ApplicationController
    before_action :set_admonition, only: %i[show edit update destroy]
  
    def index
      @admonition = Admonition.all
      render json: @admonition
    end
  
    def show
    end
  
    def new
      @admonition = Admonition.new
    end
  
    
    def create
        @admonition = Admonition.new(admonition_params)
    
        if  @admonition.save
          render json:  @admonition, status: :created
        else
          render json:  @admonition.errors, status: :unprocessable_entity
        end
      end
  
    def edit
    end
  
    def update
      if @admonition.update(admonition_params)
        redirect_to @admonition, notice: 'Amonestación actualizada exitosamente.'
      else
        render :edit
      end
    end
  
    def destroy
      @admonition.destroy
      redirect_to admonitions_path, notice: 'Amonestación eliminada exitosamente.'
    end
  
    private
  
    def set_admonition
      @admonition = Admonition.find(params[:id])
    end
  
    def admonition_params
      params.require(:admonition).permit(:admonition_types_id, :user_id, :date, :responsable_id, :status_admonition)
    end
  end
  
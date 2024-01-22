class Api::JustificationsController < ApplicationController
    before_action :set_justification, only: %i[show edit update destroy]

  def index
    @justifications = Justification.all
    render json: @justifications
  end

  def show
  end

  def new
    @justifications = Justification.new
  end

  def create
    @justifications = Justification.new(justification_params)

    if @justifications.save
      render json: @justifications, status: :created
    else
      render json: @justifications.errors, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @justifications.update(justification_params)
      redirect_to @justifications, notice: 'Justificación actualizada exitosamente.'
    else
      render :edit
    end
  end

  def destroy
    @justifications.destroy
    redirect_to justifications_path, notice: 'Justificación eliminada exitosamente.'
  end

  private

  def set_justification
    @justifications = Justification.find(params[:id])
  end

  def justification_params
      params.require(:justifications).permit(:justification_types_id, :user_id, :date, :responsable_id, :status_justification)
  end
end
  
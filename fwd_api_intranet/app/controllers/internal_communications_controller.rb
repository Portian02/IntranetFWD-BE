class InternalCommunicationsController < ApplicationController


  def index
    @internal_communications = InternalCommunication.all
    render json: @internal_communications
  end

  def show
    @internal_communications = InternalCommunication.find(params[:id])
    render json: @internal_communications
  end


  def create
    @internal_communications = InternalCommunication.new(internal_communication_params)

    if @internal_communications.save
      render json: @internal_communications, status: :created
    else
      render json: @internal_communications.errors, status: :unprocessable_entity
    end
  end



  def update
    @internal_communications = InternalCommunication.find(params[:id])

    if @internal_communications.update(internal_communication_params)
      render json: @internal_communications
    else
      render json: @internal_communications.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @internal_communications = InternalCommunication.find(params[:id])
    @internal_communications.destroy
    render json: {message: "Internal Communication deleted successfully"}, status: :ok
  end

  private

  def set_internal_communication
    @internal_communications = InternalCommunication.find(params[:id])
  end

  def internal_communication_params
    params.require(:internal_communications).permit(:title, :content, :date, :user_id)
  end
end

class Api::UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]
#  before_action :auth_user, only: %i[ create update destroy ]
  # GET /tasks
  def index
    @user = User.all

    render json: @user
  end

  # GET /tasks/1
  def show
    render json: @user
  end

  # POST /tasks
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end


  def update_password
    @user = User.params[:id] #HACER EL CAMNIO DEL PARAMETRO

    if params[:user][:password].present? && params[:user][:password_confirmation].present?
      if @user.update(user_params)
        render json: { message: 'Contraseña actualizada con éxito.' }
      else
        render json: { error: 'Error al actualizar la contraseña.' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Ingresa una contraseña y confirmación válidas.' }, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @user.destroy
    render json: { message: 'Usuario eliminado exitosamente' }, status: :ok
  end

  private

  def set_user
    @user = User.find(1) #HACER EL CAMNIO DEL PARAMETRO
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Usuario no encontrado' }, status: :not_found
  end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :identification, :number, :borndate, :type_user_id, :role)
    end
end

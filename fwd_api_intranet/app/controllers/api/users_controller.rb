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

  # DELETE /tasks/1
  def destroy
    @user.destroy
     render json: {message: "user deleted successfully"}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      begin
        @user = User.find(params[:id])
      rescue => error
        Rails.logger.error("********** user not found **********")
        @error_message = {
          message: "user not found! the ID in not present in the database"
        }
        render json: @error_message, status: :not_found


      end

    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :identification, :number, :borndate, :type_user_id)
    end
end

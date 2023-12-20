# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
 before_action :authenticate_user!, only: [:logout]
  def singup
    @user = User.new(user_params)
    if @user.save
        # new_token = encode_token(@user.email)
        render json: {message: "User created"} status: :created
    else
        render json: @user.errors, status: :unprocessable_entity
    end

end

def login
    @user = User.find_by(email: params[:email])
    # new_token = encode_token(@user.email)

    if !!@user && @user.authenticate(params[:password])
        render json: {message: "user is logged in"}, status: 201
    else
        render json: {message: "invalid credentials"}, status: :unauthorized
    end
end

def logout


end

private

se

def user_params
    params.permit(:username, :email, :password, :password_confirmation, :identification, :number, :age)
end


  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

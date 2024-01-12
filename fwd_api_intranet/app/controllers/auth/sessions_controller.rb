# frozen_string_literal: true

class Auth::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
 # before_action :authenticate_user!, only: [:logout]


 respond_to :json
 private
 def respond_with(resource, _opts = {})
   render json: resource
 end
 def respond_to_on_destroy
   render json: { message: "Logged out." }
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

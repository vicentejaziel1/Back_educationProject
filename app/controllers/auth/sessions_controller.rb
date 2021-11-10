# frozen_string_literal: true

class Auth::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  before_action :set_resource, only: :create
  respond_to :json

  # POST /resource/sign_in
  def create
    sign_in(resource_name, resource)
   # user = ActiveModelSerializers::SerializableResource.new(resource, adapter: :attributes).as_json

    render json: { access_token: request.env['warden-jwt_auth.token'],
                   user: resource,
                   account: resource.owner_type }
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  
  def respond_with(resource, _opts = {})
    render json: { message: 'You are logged in.' }, status: :ok
    #render json: resource
  end

  def respond_to_on_destroy
    head :no_content
  end


  def set_resource
    self.resource = warden.authenticate!(auth_options)
  end


  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end

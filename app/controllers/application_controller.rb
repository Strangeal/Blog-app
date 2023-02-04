class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  # protect_from_forgery Prepend: true
  # protect_from_forgery with: :exception, prepend: true
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email])
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :bio, :email, :password, :password_confirmation, :current_password)
    end
  end
end

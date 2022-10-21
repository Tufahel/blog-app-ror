class ApplicationController < ActionController::API
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email])

    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:password)
    end
  end
end
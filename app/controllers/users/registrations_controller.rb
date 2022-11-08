class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(_resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: {
      message: 'Signed up successfully',
      user: current_user,
      status: 200
    }, status: :ok
  end

  def register_failed
    render json: {
      message: 'Somehing went wrong',
      status: 401
    }, status: :unprocessable_entity
  end
end

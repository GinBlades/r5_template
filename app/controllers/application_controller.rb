class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end

    def authenticate_admin!
      return if current_user && current_user.role == "admin"
      redirect_to root_path, notice: "You must be a site administrator to access that page."
    end

    def is_admin?
      current_user && current_user.role == "admin"
    end
    helper_method :is_admin?
end

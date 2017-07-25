class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  respond_to :html, :json
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:is_female,:date_of_birth,:email,:password])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name,:is_female,:date_of_birth,:email,:password])

      end
end

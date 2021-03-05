class ApplicationController < ActionController::Base
  before_action :basic_auto
  before_action :configure_permitted_parameters, if: :device_controller?

  private
  def basic_auto
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    devise_params_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :last_name_read, :first_name, :first_name_read, :birthday])
  end
end

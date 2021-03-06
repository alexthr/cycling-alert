class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar, :bio])
  end

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

  protected

  def after_sign_in_path_for(user)
    if user.admin
      admin_issues_path
    else
      issues_path
    end
  end
end

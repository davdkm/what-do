class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Pundit
  before_action :authenticate_user!, except: [:show, :home, :index]
  before_filter :configure_permitted_parameters, if: :devise_controller?
  around_filter :set_time_zone


  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  private

    def user_not_authorized(exception)
      flash[:error] = "Access denied."
      redirect_to(request.referrer || root_path)
    end

    def set_time_zone
      old_time_zone = Time.zone
      Time.zone = current_user.time_zone if logged_in?
      yield
    ensure
      Time.zone = old_time_zone
    end

  # allow params for name to be used when signing up and updating
  protected
    def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :remember_me) }
     devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
    end
end

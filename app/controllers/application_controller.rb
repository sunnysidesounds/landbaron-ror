class ApplicationController < ActionController::Base
  protect_from_forgery
  # helper_method :current_user
  before_filter :authenticate_user!
  skip_before_filter  :verify_authenticity_token

  before_action :configure_permitted_parameters, if: :devise_controller?

  # def current_user
  #   # Note: we want to use "find_by_id" because it's OK to return a nil.
  #   # If we were to use User.find, it would throw an exception if the user can't be found.
  #   @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  # end

  # def authenticate_user
  #   if current_user.nil?
  #     flash[:error] = 'Please sign in to view this page!'
  #     redirect_to :root
  #   end
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :phone_number, :address, :city, :state, :postal_code, :income_range, :username, :email, :password, :password_confirmation, :principle_investor, :verified, :remember_me, :login_attr) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me, :login_attr) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password, :login_attr) }
  end
end

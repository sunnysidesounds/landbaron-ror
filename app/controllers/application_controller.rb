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
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :phone_number, :address, :city, :state, :postal_code, :income_range, :username, :email, :password, :password_confirmation, :principle_investor, :verified, :remember_me, :login_attr, :country,  :property_types, :deal_types, :budget_range, :risk_tolerance, :property_categories, :annual_income_without_taxes, :reason_to_invest, :invested_in_realestate, :describes_you, :current_investments, :hear_about_us) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me, :login_attr) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password, :login_attr) }
  end

  private

  def after_sign_out_path_for(resource_or_scope)
    if Rails.env.development?
      new_user_session_path
    else
      "http://www.landbaronclub.com"
    end
  end

  # def authenticate_user!
  #   super
  #   if user_signed_in? && current_user.is_a?(User) && !current_user.is_accepted?
  #     # flash[:alert] = "Your account awaits admin approval, We will contact you soon." if current_user.is_pending?
  #     # flash[:alert] = "Since you are not an accredited investor, we appologize for giving you access to listings." if current_user.is_denied?
  #     return "http://www.landbaronclub.com/thanks-for-joining-the-list/" if resource.is_a?(User) && resource.is_pending? # Or :prefix_to_your_route
  #     return "http://www.landbaronclub.com/sorry/" if resource.is_a?(User) && resource.is_denied?
  #     sign_out current_user
  #     redirect_to user_session_path
  #   end
  # end

  def after_sign_in_path_for(resource)
    return admin_root_path if resource.is_a? AdminUser
      sign_out resource
      flash.delete(:notice)
      # flash[:alert] = "Your account awaits admin approval, We will contact you soon." if resource.is_pending?
      # flash[:alert] = "Since you are not an accredited investor, we appologize for giving you access to listings." if resource.is_denied?
      return "http://www.landbaronclub.com/thanks-for-joining-the-list/" if resource.is_a?(User) && resource.is_pending? # Or :prefix_to_your_route
      return "http://www.landbaronclub.com/sorry/" if resource.is_a?(User) && resource.is_denied?
    return "/investments"
  end
end

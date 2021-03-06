class DeviseOverrides::RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    build_resource(user_params)
    is_dev_env = request.base_url.include?("localhost") || request.base_url.include?("dev.landbaronclub.com")
    resource.sync_user_to_marketo_leads(is_dev_env)
    resource.username = resource.email
    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end


  def update
    super
  end

  private
    def user_params
      params.require(:user).permit!#(:first_name, :last_name, :phone_number, :address, :city, :state, :postal_code, :income_range, :username, :email, :password, :password_confirmation, :principle_investor, :verified, :remember_me, :login_attr, :country)      
    end

end 
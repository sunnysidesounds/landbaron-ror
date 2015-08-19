class DeviseOverrides::RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    puts "*" * 100
    is_dev_env = request.base_url.include?("localhost:3000") || request.base_url.include?("dev.landbaronclub.com")
    @user = User.new(user_params)
    puts @user
    @user.sync_user_to_marketo_leads(is_dev_env)
    super
  end


  def update
    super
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :phone_number, :address, :city, :state, :postal_code, :income_range, :username, :email, :password, :password_confirmation, :principle_investor, :verified, :remember_me, :login_attr, :country)      
    end

end 
class AuthenticationController < ApplicationController

  # Sign in
  def sign_in
    @user = User.new
  end

  # This method is called to sign out a user by email or username
  def signed_out
    session[:user_id] = nil
    flash[:notice] = "You have been signed out."
  end

  # This method is used to login a user
  def login
    username_or_email = params[:user][:username]
    password = params[:user][:password]

    if username_or_email.rindex('@')
      email=username_or_email
      user = User.authenticate_by_email(email, password)
    else
      username=username_or_email
      user = User.authenticate_by_username(username, password)
    end

    if user
      flash[:notice] = 'Welcome.'
      redirect_to :root
    else
      flash.now[:error] = 'Unknown user. Please check your username and password.'
      render :action => "sign_in"
    end

  end

  # New user
  def new_user
    @user = User.new
  end

  # This method is used to sign-up a user
  def register
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'Welcome.'
      redirect_to :root
    else
      render :action => "new_user"
    end
  end

  #You can no longer do mass assignments in Rails 4. This method helps with this change
  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :username, :email, :password, :password_confirmation)
  end

end
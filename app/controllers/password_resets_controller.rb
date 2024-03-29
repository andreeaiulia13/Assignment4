class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]
  before_action :handle_user_validation, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new; end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest!
      @user.send_password_reset_email
      flash[:info] = 'Email sent with password reset instructions'

      redirect_to root_url
    else
      flash.now[:danger] = 'Email address not found'
      render 'new'
    end
  end
    
  def edit; end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @user.update(user_params)
      reset_session
      log_in(@user)
      flash[:succes] = 'Password has been reset.'

      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def get_user
    @user = User.find_by(email: params[:email])
  end

  def handle_user_validation
    redirect_to root_url unless @user&.activated? && @user&.authenticated?(:reset, params[:id])
  end

  def check_expiration
    return unless @user.password_reset_expired?
    
    flash[:danger] = 'Password reset expired'
      
    redirect_to new_password_reset_url
  end
end

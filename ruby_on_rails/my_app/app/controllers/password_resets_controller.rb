# frozen_string_literal: true

# controller password reset
class PasswordResetsController < ApplicationController
  before_action :load_user, only: %i[edit update]
  before_action :valid_user, only: %i[edit update]
  before_action :check_expiration, only: %i[edit update]
  def new; end

  def create
    @user = User.find_by(email: params[:password_resets][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = 'Email sent with password reset instructions'
      redirect_to root_path
    else
      flash.now[:danger] = 'Email address not found'
      render 'new', status_code: :not_found
    end
  end

  def edit; end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, 'cant be empty')
      render 'edit', status_code: :unprocessable_entity
    elsif @user.update(user_params)
      log_in(@user)
      flash[:success] = 'password has been reset'
      redirect_to root_path
    else
      render 'edit', status_code: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def load_user
    @user = User.find_by(email: params[:email])
  end

  def valid_user
    return if @user&.activated? && @user&.authenticated?(:reset, params[:id])

    flash[:warning] = 'invalid reset link'
    redirect_to root_url
  end

  def check_expiration
    return unless @user.password_reset_expired?

    flash[:danger] = 'Password reset has expired.'
    redirect_to new_password_reset_url
  end
end

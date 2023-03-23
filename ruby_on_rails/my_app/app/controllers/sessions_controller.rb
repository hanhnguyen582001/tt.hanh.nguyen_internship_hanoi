class SessionsController < ApplicationController
  include SessionHandling
  rescue_from StandardError, with: :handle_error
  def new; end

  def create
    return handle_blank_session if params[:session].blank?

    user = User.find_by(email: params.dig(:session, :email).downcase)
    if active_user?(user)
      handle_active_user(user)
    elsif inactive_user?(user)
      handle_inactive_user
    else
      handle_invalid_user
    end
    # if user&.authenticate(params[:session][:password])
    #   if user.activated?
    #     log_in user
    #     params[:session][:remember_me] == '1' ? remember(user) : forget(user)
    #     redirect_back_or user
    #   else
    #     message = 'account not activated. Check your email for the activation link.'
    #     flash[:warning] = message
    #     redirect_to root_path
    #   end
    # else
    #   flash.now[:danger] = 'invalid email or password'
    #   render 'new', status: :unprocessable_entity
    # end
    # rescue StandardError => e
    #   debugger
    #   redirect_to root_path
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

  private

  def handle_error
    flash[:error] = 'something went wrong'
    redirect_to root_path
  end
end

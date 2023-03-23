module SessionHandling
  extend ActiveSupport::Concern
  def active_user?(user)
    user&.authenticate(params[:session][:password]) && user&.activated?
  end

  def inactive_user?(user)
    user&.authenticate(params[:session][:password]) && !user&.activated?
  end

  def handle_active_user(user)
    log_in user
    params[:session][:remember_me] == '1' ? remember(user) : forget(user)
    redirect_back_or user
  end

  def handle_inactive_user
    message = t('inactive_email_warning')
    flash[:warning] = message
    redirect_to root_path
  end

  def handle_invalid_user
    flash.now[:danger] = 'Invalid email or password'
    render 'new', status: :unprocessable_entity
  end

  def handle_blank_session
    flash.now[:danger] = 'Invalid session'
    render 'new', status: :unprocessable_entity
  end
end

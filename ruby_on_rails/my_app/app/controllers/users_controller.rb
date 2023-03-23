class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[edit update index]
  before_action :correct_user, only: %i[edit update]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  def index
    @users = User.where(activated: true).paginate(page: params[:page], per_page: 10)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page], per_page: 10)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = t('.check_email')
      redirect_to root_url
    else
      respond_to do |format|
        format.html { render :new }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = t('users.update_success')
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    User.find(params[:id]).destroy!
    flash[:success] = t('users.delete_success')
    redirect_to users_url
  rescue ActiveRecord::RecordNotDestroyed
    redirect_to root_path
  end

  def following
    @title = t('title_pages.following')
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page], per_page: 10)
    render 'show_follow'
  end

  def followers
    @title = t('title_pages.followers')
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page], per_page: 10)
    render 'show_follow'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = t('login_warning')
    redirect_to login_url
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def not_found
    flash[:warning] = 'Cant found this user'
    redirect_to root_path
  end
end

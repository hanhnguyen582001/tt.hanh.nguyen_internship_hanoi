class MicropostsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]
  before_action :correct_user, only: %i[destroy]
  def create
    @micropost = current_user.microposts.build(micropost_params)
    @micropost.image.attach(params[:micropost][:image])
    if @micropost.save
      flash[:success] = 'Micropost created!'
      redirect_to root_url
    else
      render 'my_static_pages/home', status_code: :unprocessable_entity
    end
  end

  def destroy
    Micropost.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to request.referrer || user_url(current_user)
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :image)
  end

  def logged_in_user
    return if logged_in?

    flash[:danger] = 'please login to post your micropost!'
    redirect_to root_path
  end

  def correct_user
    return unless current_user.microposts.find_by(id: params[:id]).nil?

    redirect_to root_path
  end
end

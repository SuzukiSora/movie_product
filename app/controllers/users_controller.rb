class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:edit]


  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    set_user
  end

  def edit
    set_user
  end

  def update
    set_user
    @user.update params.require(:user).permit(:comment, :image)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(
      :comment, :image
    )
  end

  def set_user
    @user = User.find(params[:id])
  end
  
end

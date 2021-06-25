class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @albums = @user.albums
  end

  def edit
    @user = User.find(params[:id])
    unless current_user.id == @user.id
      redirect_to action: :show
    end
  end

  def update
    if current_user.update(user_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:group_name, :email, :area_id, :theme_id, :group_introduction)
  end
end

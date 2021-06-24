class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @albums = @user.albums
  end

  def edit
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

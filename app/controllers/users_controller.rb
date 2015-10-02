class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes!(user_attributes)
    redirect_to :root
  end

  private

  def user_attributes
    params.require(:user).permit(:avatar)
  end
end

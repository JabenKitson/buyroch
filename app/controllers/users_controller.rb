class UsersController < ApplicationController
  before_filter :authenticate_user!
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end

  def user_params
    user_paramsrams.require(:user).permit(:avatar)
  end
end

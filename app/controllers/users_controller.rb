class UsersController < ApplicationController
  def index
    @users = User.all
    authorize current_user
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    authorize current_user
    @user.destroy
    redirect_to users_path
  end

end

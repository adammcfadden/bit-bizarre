class UsersController < ApplicationController
  def index
    @users = User.all
    if current_user
      authorize current_user
    else
      flash[:alert] = "You are not authorized to view this page"
      redirect_to new_user_registration_path
    end
  end

  def show
    @user = User.new
  end

  def destroy
    @user = User.find(params[:id])
    authorize current_user
    @user.destroy
    redirect_to users_path
  end

end

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
end

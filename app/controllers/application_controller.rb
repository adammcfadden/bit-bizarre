class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from Pundit::NotDefinedError, with: :user_not_defined
  def is_admin?
    current_user && current_user.admin?
  end

  helper_method :is_admin?

private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  def user_not_defined
    flash[:alert] = "You must sign in to do this."
    redirect_to(new_user_session_path)
  end

end

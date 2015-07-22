class UserPolicy
  attr_reader :current_user, :target_user

  def initialize(current_user, target_user)
    @current_user = current_user
    @target_user = target_user
  end

  def destroy?
    @current_user.admin? || @current_user == @target_user
  end

  def index?
    if @current_user
      @current_user.admin?
    end
  end

  def show?
   @current_user
  end

end

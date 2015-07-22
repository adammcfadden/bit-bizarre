class ItemPolicy
  attr_reader :current_user, :item

  def initialize(current_user, item)
    @current_user = current_user
    @item = item
  end

  def edit?
    if @current_user
      @current_user.admin? || @current_user == @item.user
    end
  end

  def destroy?
    @current_user.admin? || @current_user == @item.user
  end

  def index?
    @current_user
  end

  def show?
    @current_user
  end

end

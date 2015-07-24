class CartsController < ApplicationController
  def new
    @item = Item.find(params[:item])
    @cart = current_user.cart
    @cart.items << @item
    flash[:notice] = "#{@item.name} Added to Cart - Check out some more items from #{@item.user.email}"
    redirect_to user_path(@item.user)
  end
end

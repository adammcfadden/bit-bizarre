class CartsController < ApplicationController
  def new
    @item = Item.find(params[:item])
    @cart = current_user.cart
    @cart.items << @item
    flash[:notice] = "#{@item.name} Added to Cart"
    redirect_to cart_path(@cart)
  end

  def update
    @cart = current_user.cart
    @item = Item.find(params[:item])
    @cart.items.delete(@item)
    flash[:alert] = "#{@item.name} Deleted from Cart"
    redirect_to cart_path(@cart)
  end
end

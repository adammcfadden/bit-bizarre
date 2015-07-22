class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show

  end

  def new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :body, :price, :user_id)
  end


end

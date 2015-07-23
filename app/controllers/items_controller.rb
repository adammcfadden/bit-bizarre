class ItemsController < ApplicationController

  def index
    @items = Item.all
    authorize @items
  end

  def show
    @item = Item.find(params[:id])
    authorize @item
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
      item = Item.find(params[:id])
      item.destroy
      @posts = Item.all
      redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :body, :price, :user_id, :avatar)
  end


end

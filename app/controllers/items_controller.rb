class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  def index
    @items = Item.order(sort_column + ' ' + sort_direction)
    # .paginate(per_page: 15, page: params[:page])
    authorize @items
  end

  def show
    authorize @item
  end

  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    authorize @item
  end

  def update
    if @item.update(item_params)
      flash[:notice] = "Item updated!"
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    authorize @item
    @item.destroy
    @posts = Item.all
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :body, :price, :user_id, :avatar)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def sort_column
    params[:sort] || "name"
  end

  def sort_direction
    params[:direction] || "asc"
  end
end

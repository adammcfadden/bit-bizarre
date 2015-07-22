class HomeController < ApplicationController

  def index
    @items = Item.all
    @users = User.all
  end
end

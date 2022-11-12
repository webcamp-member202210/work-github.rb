class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @genres = Genre.all
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  def show
  end

  def edit
  end

  def update
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active)
  end
end

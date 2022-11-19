class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @tax = (@item.price*1.1).floor
    @cart_item = CartItem.new
  end

  def create
    @item = Item.new(item_params)
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end

end

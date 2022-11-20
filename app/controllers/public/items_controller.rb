class Public::ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index]

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
  
  def move_to_signed_in
    unless customer_signed_in?
      redirect_to new_customer_session_path
    end
  end

end

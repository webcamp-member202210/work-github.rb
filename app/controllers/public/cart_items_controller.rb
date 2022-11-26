class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items.all
    @customer = current_customer
    @tax = 1.1
    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price += cart_item.item.price*cart_item.amount
    end
    @total_price *= @tax
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      if cart_item.item_id == @cart_item.item_id
        new_amount = cart_item.amount + @cart_item.amount
        cart_item.update_attribute(:amount, new_amount)
        @cart_item.delete
        redirect_to cart_items_path
      end
    end
    if @cart_item.save
      flash[:notice] = "商品をカートに追加しました"
      redirect_to cart_items_path
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.delete
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
  end
    
  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end
end

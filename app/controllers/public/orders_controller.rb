class Public::OrdersController < ApplicationController
  def new
    @customer = current_customer
    @addresses = Address.all
    @order = Order.new
  end

  def destroy
    @order = Order.find(params[:id])
    @order.delete
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    @tax = 1.1

    if @order.save
      @cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.item_id = cart_item.item_id
        @order_detail.order_id = @order.id
        @order_detail.price = cart_item.item.price*@tax
        @order_detail.amount = cart_item.amount
        @order_detail.making_status = 0
        @order_detail.save
      end
      @cart_items.delete_all
      flash[:notice] = "注文完了しました"
      redirect_to orders_thanks_path
    else
      render :thanks
    end
  end

  def thanks
  end

  def confirm
    @postage = 800
    @cart_items = current_customer.cart_items.all
    @customer = current_customer
    @tax = 1.1
    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price += cart_item.item.price*cart_item.amount
    end
    @total_price *= @tax
    @bill = @postage + @total_price
    
    if params[:order][:select_address] == "0"
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address_code = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    end

    if params[:order][:select_address] == "1"
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address_code = @address.address
      @order.name = @address.name
    end

    if params[:order][:select_address] == "2"
      @order = Order.new(order_params)
    end
    
    if params[:order][:select_address] == ""
      @order = Order.new(order_params)
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address_code, :name, :postage, :bill, :payment_method, :status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :price, :amount, :making_status)
  end
end

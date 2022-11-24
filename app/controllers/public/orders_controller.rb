class Public::OrdersController < ApplicationController
  def new
    @customer = current_customer
    @addresses = Address.all
    @order = Order.new
  end

  def index
  end

  def show
  end

  def create
  end

  def thanks
  end

  def confirm
    if params[:order][:select_address] == 0
      @order = Order.new(order_params)
      @order.postal_code = current_costomer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    end
    if params[:order][:select_address] == 1
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end
    if params[:order][:select_address] == 2
      @order = Order.new(order_params)
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address_code, :name, :postage, :bill, :payment_method, :status)
  end
end

class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all
    @customer = Customer
    @item = @orders.
  end
end

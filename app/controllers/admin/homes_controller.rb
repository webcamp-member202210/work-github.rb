class Admin::HomesController < ApplicationController
  before_action :admin_signed_in
  
  def top
    @orders = Order.all
    @order_details = OrderDetail.all
    @amount = 0
  end
  
  private
  
  def admin_signed_in
    unless admin_signed_in?
      redirect_to new_admin_session_path
    end
  end
  
end
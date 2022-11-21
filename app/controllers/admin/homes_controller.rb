class Admin::HomesController < ApplicationController
  before_action :admin_signed_in
  def top
    @orders = Order.all
  end
  
  private
  
  def move_to_signed_in
    unless customer_signed_in?
      redirect_to new_customer_session_path
    end
  end
  
end
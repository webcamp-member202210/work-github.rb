class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "注文ステータスを更新しました"
      redirect_to admin_homes_top_path
    else
      flash[:notice] = "注文ステータス更新に失敗しました"
      render :show
    end
  end  
    
  private
  
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address_code, :name, :postage, :bill, :payment_method, :status)
  end
end

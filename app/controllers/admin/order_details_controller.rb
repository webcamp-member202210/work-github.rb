class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      flash[:notice] = "製造ステータスを更新しました"
      redirect_to admin_order_path(@order_detail.order.id)
    else
      flash[:notice] ="製造ステータス更新に失敗しました"
      render "admin/orders/:id"
    end
  end
      
  private
  
  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :price, :amount, :making_status)
  end
end

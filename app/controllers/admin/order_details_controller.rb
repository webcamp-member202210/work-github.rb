class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @count = 0
    if @order_detail.update(order_detail_params)
      @order.order_details.each do |order_detail|
        if order_detail.making_status == "complete"
          @count += 1
        end
      end
      if @order.order_details.count == @count
        @order.update(status: 3)
      end
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

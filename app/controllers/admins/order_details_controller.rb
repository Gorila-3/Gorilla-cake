class Admins::OrderDetailsController < ApplicationController
  before_action :authenticate_admin
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    # binding.pry
    @order_detail.update(order_detail_params)
    @order = @order_detail.order
    @order_detail.order_status_auto_update
    @order_detail.making_complete_auto_update
    redirect_to admins_order_path(@order)
  end
  
    private
  
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end

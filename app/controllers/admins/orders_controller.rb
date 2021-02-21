class Admins::OrdersController < ApplicationController
  
  def index
    @orders = Order.all
    # @total_amount = detail_total_amount(order_details)
    # binding.pry
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details   #中間テーブル自体を変数にしておくことで、親テーブルどちらの情報も取ってこれるようにしている。
    # binding.pry
  end

  def update
    # binding.pry
    @order = Order.find(params[:id])
    @order.update(order_update_params)
    @order.order_detail_status_auto_update
    redirect_to admins_order_path
  end
  
  private
  
  def order_update_params
    params.require(:order).permit(:status)
  end

  
end

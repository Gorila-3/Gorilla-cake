class Customers::OrdersController < ApplicationController
  def new
  end

  def create
  end

  def thanks
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def check
  end
end

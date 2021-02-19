class Customers::OrdersController < ApplicationController
  def new
    @customer = Customer.find(current_customer.id)
    @order = Order.new
  end

  def create
  end

  def thanks
  end

  def index
  end

  def show
  end

  def check
    @order = Order.new(order_params)
    @cart_items = CartItem.where(customer_id: current_customer.id)
  end
  
  private
  
  def order_params
    params.require(:orders).permit
  end
end

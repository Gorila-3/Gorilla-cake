class Customers::OrdersController < ApplicationController
  def new
    @cart_item = current_customer.cart_items
    if @cart_item.empty?
      redirect_to customers_cart_items_path
    end
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.save

  end

  def thanks
  end

  def index
  end

  def show
  end

  def check
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @tax = 0.08
    @ship_cost = 800

    @total_price = 0
    @cart_items.each do |cart_item|
    @total_price += cart_item.item.price * cart_item.amount
    end
  end

  private

  def order_params
   params.require(:order).permit(:payment_method, :name, :address, :postal_code)
  end
end

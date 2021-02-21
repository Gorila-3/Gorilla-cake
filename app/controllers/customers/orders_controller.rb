class Customers::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.where(customer_id: current_customer)
    
    #カート内商品がなければnewにパス
    cart_items = current_customer.cart_items
    if cart_items.empty?
       redirect_to customers_cart_items_path
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    
    # カート商品　保存
    current_customer.cart_items.each do |cart_item|
      order_detail = @order.order_details.build
      order_detail.order_id = @order.id
      order_detail.item_id = cart_item.item_id
      order_detail.amount = cart_item.amount
      order_detail.price = cart_item.item.price
      order_detail.save
      cart_item.destroy
    end
      render :thanks
    #新しい住所登録を行なった場合配送先テーブルに保存
    if Address.find_by(address: @order_address).nil?
      @address = Address.new
      @address.name = @order.name
      @address.address = @order.address
      @address.postal_code = @order.postal_code
      @address.customer_id = current_customer.id
      @address.save
    end


  end

  def thanks
  end

  def index
  end

  def show
  end

  def check
    @order = Order.new
    @cart_items = current_customer.cart_items
    @tax = 0.08
    @ship_cost = 800

    @total_price = 0
    @cart_items.each do |cart_item|
    @total_price += cart_item.item.price * cart_item.amount
    end

    @total_payment = @total_price * (1 + @tax) + @ship_cost

    @order.payment_method = params[:order][:payment_method]
    shipping = params[:order][:shipping].to_i
    case shipping
    when 1
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    when 2
      @ship = params[:order][:your_address].to_i
      @registration_address = Address.find(@ship)
      @order.postal_code = @registration_address.postal_code
      @order.address = @registration_address.address
      @order.name = @registration_address.name
    when 3
      #新しいお届け先が入力されていない場合　newにパス
      if params[:order][:new_address][:postal_code] == ""  && params[:order][:new_address][:address] == "" && params[:order][:new_address][:name] == ""
        flash[:notice] = "新しいお届け先が全て入力されていません"
        redirect_to new_customers_order_path
      elsif params[:order][:new_address][:postal_code] == ""
        flash[:notice] = "新しいお届け先の郵便番号が入力されていません"
        redirect_to new_customers_order_path
      elsif params[:order][:new_address][:address] == ""
        flash[:notice] =  "新しいお届け先の住所が入力されていません"
        redirect_to new_customers_order_path
      elsif params[:order][:new_address][:name] == ""
        flash[:notice] = "新しいお届け先の宛名が入力されていません"
        redirect_to new_customers_order_path
      else

      @order.postal_code = params[:order][:new_address][:postal_code]
      @order.address = params[:order][:new_address][:address]
      @order.name = params[:order][:new_address][:name]
      end
    end
  end

  private

  def order_params
   params.require(:order).permit(:customer_id, :payment_method, :name, :address, :postal_code, :shipping_cost, :total_payment, :status,
   order_details_attributes:[:order_id, :item_id, :amount, :price, :making_status])
  end
end

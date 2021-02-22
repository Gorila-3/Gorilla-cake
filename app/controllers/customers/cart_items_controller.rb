class Customers::CartItemsController < ApplicationController
  before_action :authenticate_customer
  # def create
  #   # @cart_item = CartItem.create(cart_item_params)
  #   @cart_item = CartItem.new(cart_item_params)

  #   if @cart_item.amount == nil    #後で消します
  #     redirect_to request.referer  #後で消します
  #   end                            #後で消します

  #   if current_customer.cart_items.where(item_id: @cart_item.item_id).exists?  #カートに入っている商品か見分ける処理
  #     # @existed_item = CartItem.where(customer_id: current_customer.id).where(item_id: @cart_item.item_id)
  #     @existed_item = current_customer.cart_items.where(item_id: @cart_item.item_id)
  #     binding.pry
  #     new_amount = @existed_item.amount + @cart_item.amount
  #   else
  #     @cart_item.save
  #   end
  #   redirect_to customers_cart_items_path
  # end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_items = current_customer.cart_items.all

    @cart_items.each do |cart_item|
      if cart_item.item_id == @cart_item.item_id
        new_amount = cart_item.amount + @cart_item.amount
        cart_item.update_attribute(:amount, new_amount)
        @cart_item.delete
      end
    end
    @cart_item.save
    redirect_to customers_cart_items_path
  end

  def index
    # @item = Item.find(item.id)
    @cart_items = current_customer.cart_items
    @tax = 0.08
    # binding.pry

    @total_price = 0
    @cart_items.each do |cart_item|
    @total_price += cart_item.item.price * cart_item.amount
    end

  end

  def destroy
    CartItem.find(params[:id]).destroy
    redirect_to customers_cart_items_path
  end

  def all_destroy
    @cart_items = current_customer.cart_items.all
    # binding.pry
    @cart_items.each do |cart_item|
      cart_item.destroy
    end
    redirect_to customers_cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      flash[:notice] = "カートの中身を変更しました。"
      redirect_to customers_cart_items_path
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id,:customer_id, :amount)
  end

  def price_total_method
    @total_price = 0
    @cart_items.each do |cart_item|
    @total_price += cart_item.price
    end
  end

end


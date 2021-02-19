class Customers::CartItemsController < ApplicationController
  def create
    # select_numbers = [*(1..9)]
    @cart_item = CartItem.create(cart_item_params)
    
    redirect_to customers_cart_items_path
    
    # もし、同じ商品がカート内に追加されたら、カート内の商品の個数だけを増やすようにif文描かんといかん
  end

  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @tax = 0.08
    # binding.pry
   
  end

  def destroy
  end

  def all_destroy
  end

  def update
  end
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id,:customer_id, :amount)
  end
end


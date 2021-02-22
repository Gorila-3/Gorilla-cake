class Customers::ItemsController < ApplicationController


  def index
   @items = Item.where(is_active: true).all.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @tax = 0.1 #消費税１０%を、ここで定義しています。
    @tax_in_price = @item.price * (1 + @tax)
    @tax_in_price = @tax_in_price.to_i #上とあわした二行で、値段を三点区切りで表示しています。なんか汚いのでいい方法あったら
    @cart_item = CartItem.new
    if customer_signed_in?
     @existed_item = current_customer.cart_items.find_by(item_id: @item.id)
    end
    # binding.pry
  end

  def top
    @new_items = Item.where(is_active: true).all.order(created_at: :desc)     #販売中のアイテムを、更新した順に取り出している。
    @new_items.limit!(4)                                                      #取り出したアイテムを、４つだけにしている。
    # binding.pry
  end

  def about
  end
end

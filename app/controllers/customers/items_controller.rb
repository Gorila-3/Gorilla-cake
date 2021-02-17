class Customers::ItemsController < ApplicationController
  
  def index
   @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @tax = 0.1 #消費税１０%を、ここで定義しています。
    @tax_in_price = @item.price * (1 + @tax)
    @tax_in_price = @tax_in_price.to_i #上とあわした二行で、値段を三点区切りで表示しています。なんか汚いのでいい方法あったら
    
    @cart_item = CartItem.new
  end

  def top
    @new_items =Item.all.order(created_at: :desc)  #アイテムを、更新した順に取り出している。
    @new_items.limit!(4)                           #取り出したアイテムを、４つだけにしている。
    # binding.pry
  end

  def about
  end
end

class Customers::ItemsController < ApplicationController
  def index
  end

  def show
  end

  def top
    @new_items =Item.all.order(created_at: :desc)  #アイテムを、更新した順に取り出している。
    @new_items.limit!(4)                           #取り出したアイテムを、４つだけにしている。
    # binding.pry
  end

  def about
  end
end

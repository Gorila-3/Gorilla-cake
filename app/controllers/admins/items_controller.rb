class Admins::ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item= Item.new(item_params)
    @item.save
  end


  def edit
  end

  def update
  end
  
 
  
end

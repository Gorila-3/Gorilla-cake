class Admins::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page])
  end

  def new
    @item = Item.new
    @categories = Category.all
  end

  def create
    @item= Item.new(item_params)
    @item.save
    redirect_to admins_item_path(@item)
  end

  def show
    @item = Item.find(params[:id])
    @tax = 1.08
  end

  def edit
    @item = Item.find(params[:id])
    @categories = Category.all
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admins_item_path()
  end

 private

def item_params
 params.require(:item).permit(:image,:name,:introduction,:category_id,:price,:is_active)
end

end

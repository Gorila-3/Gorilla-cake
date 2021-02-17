class Admins::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page])
  end

  def new
    @item = Item.new
    @categories = Category.all
  end

  def create
    @item= Item.create(item_params)
    @item_category = @item.category.name
    binding.pry
    @item.save
    # binding.pry
    redirect_to admins_items_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admins
  end

 private

def item_params
 params.require(:item).permit(:image,:name,:introduction,:category_id,:price,:is_active)
end

end

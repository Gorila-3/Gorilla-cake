class Admins::ItemsController < ApplicationController
  before_action :authenticate_admin
  def index
    @items = Item.all.page(params[:page])
  end

  def new
    @item = Item.new
    @categories = Category.all
  end

  def create
    @item= Item.new(item_params)
    if @item.save
      redirect_to admins_item_path(@item)
    else
      @categories = Category.all
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
    @tax = 0.08
  end

  def edit
    @item = Item.find(params[:id])
    @categories = Category.all
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admins_item_path(@item)
    else
      @categories = Category.all
      render 'edit'
    end
  end

 private

def item_params
 params.require(:item).permit(:image,:name,:introduction,:category_id,:price,:is_active)
end

end

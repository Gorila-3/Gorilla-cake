class Admins::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to admins_categories_path
  end

  def edit
    @category= Category.find(params[:id])
  end

  def update
  end
end

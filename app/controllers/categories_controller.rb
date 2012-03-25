class CategoriesController < ApplicationController
  add_breadcrumb "Home", :root_path
  
  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    add_breadcrumb @category.name, category_path(@category)
  end
end

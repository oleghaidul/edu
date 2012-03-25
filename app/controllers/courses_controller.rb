class CoursesController < ApplicationController
  before_filter :load_categories
  add_breadcrumb "home", :root_path

  def index
    @courses = Course.all
    add_breadcrumb "index", courses_path
  end

  def show
    authenticate_user!
    @course = Course.find(params[:id])
  end

  def load_categories
    @categories = Category.all
  end
end

class CoursesController < ApplicationController
  before_filter :load_categories
  add_breadcrumb "Home", :root_path

  def search
    @search = Course.search do
      fulltext params[:search]
    end
    @courses = @search.results
    add_breadcrumb "Search: #{params[:search]}", :search_path
    render :index
  end

  def index
    @courses = Course.all
    add_breadcrumb "Courses", courses_path
  end

  def show
    authenticate_user!
    @course = Course.find(params[:id])
    add_breadcrumb @course.category.name, category_path(@course.category) if @course.category
    add_breadcrumb @course.name, course_path(@course)
  end

  def load_categories
    @categories = Category.all
  end
end

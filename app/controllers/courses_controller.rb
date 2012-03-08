class CoursesController < ApplicationController
  before_filter :load_categories


  def index
    @courses = Course.all
  end

  def show
    authenticate_user!
    @course = Course.find(params[:id])
  end

  def load_categories
    @categories = Category.all
  end
end

class LessonsController < ApplicationController
  before_filter :load_course
  respond_to :html, :js
  

  def show
  end

  def videos
    @videos = @lesson.videos
    add_breadcrumb "Videos", videos_course_lesson_path(@course, @lesson)
  end

  def documents
    @documents = @lesson.documents
    add_breadcrumb "Documents", documents_course_lesson_path(@course, @lesson)
  end

  def tests
    @testings = @lesson.testings
    add_breadcrumb "Tests", tests_course_lesson_path(@course, @lesson)
  end

  def load_course
    @course = Course.find(params[:course_id])
    @lesson = @course.lessons.find(params[:id])
    add_breadcrumb "Home", :root_path
    add_breadcrumb @course.category.name, category_path(@course.category)
    add_breadcrumb @course.name, course_path(@course)
    add_breadcrumb @lesson.name, course_lesson_path(@course, @lesson)
  end

end

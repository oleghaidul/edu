class LessonsController < ApplicationController
  before_filter :load_course
  respond_to :html, :js

  def show
  end

  def videos
    render :show
  end

  def documents
    render :show
  end

  def tests
    @testings = @lesson.testings
  end

  def load_course
    @course = Course.find(params[:course_id])
    @lesson = @course.lessons.find(params[:id])
  end

end

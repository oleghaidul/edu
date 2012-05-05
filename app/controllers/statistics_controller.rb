class StatisticsController < ApplicationController
  before_filter :authenticate_user!
  add_breadcrumb "Home", :root_path

  def index
    @courses = current_user.courses
    add_breadcrumb "Statistics", statistics_path
  end

  def courses
  	@courses = current_user.courses
  end

  def testings
  	@testings = current_user.testings
  end

  def questions
  	@questions = current_user.questions
  end

  %w[passed failed new_courses].each do |status|
    define_method status.to_s do
      @courses = current_user.courses.send(status)
      add_breadcrumb "Statistics", statistics_path
      add_breadcrumb status.capitalize, "/statistics/#{status}"
      render :index
    end
  end

end

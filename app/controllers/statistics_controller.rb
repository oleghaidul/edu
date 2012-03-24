class StatisticsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @courses = current_user.courses
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

end

class StatisticsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @courses = current_user.courses
  end
end

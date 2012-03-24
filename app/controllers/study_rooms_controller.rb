class StudyRoomsController < ApplicationController
  def index
    @courses = current_user.courses
    @categories = Category.all
  end
end

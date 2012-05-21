class StudentsController < ApplicationController

  load_resource :user
  load_resource :teacher

  def index
    @students = User.where(:role => "student")
  end

  def show
    @student = User.find(params[:id])
    @courses = Course.all - @student.courses
  end

end

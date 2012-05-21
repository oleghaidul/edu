class TeachersController < ApplicationController

  load_resource

  def index
    @teachers = current_user.teachers
  end

  def students
    
  end
end

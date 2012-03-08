class UserCoursesController < ApplicationController

  def create
    @user_course = current_user.user_courses.build(:course_id => params[:id])
    if @user_course.save
      redirect_to :back, :notice => "Ok"
    else

    end
  end

  def destroy
    @user_course = current_user.user_courses.where(:course_id => params[:id]).first
    @user_course.destroy
    redirect_to :back, :notice => "Ok"
  end
    
end

class UserCoursesController < ApplicationController

  def create
    @user_course = current_user.user_courses.build(:course_id => params[:id])
    if @user_course.save
      redirect_to :back, :notice => "#{view_context.link_to 'Course', @user_course.course}
                                     was successfully added to your 
                                     #{view_context.link_to 'study room', study_rooms_path}".html_safe
    else

    end
  end

  def destroy
    @user_course = current_user.user_courses.where(:course_id => params[:id]).first
    @user_course.destroy
    redirect_to :back, :notice => "#{view_context.link_to 'Course', @user_course.course}
                                   was successfully deleted from your 
                                   #{view_context.link_to 'study room', study_rooms_path}".html_safe
  end
    
end

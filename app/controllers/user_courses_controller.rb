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

  def bulk
    student = User.find(params[:student_id])
    params[:course_ids].delete_if{ |c| c.empty? }.each do |c|
      student.user_courses.create!(:course_id => c.to_i, :created_by_id => current_user.id)
    end

    redirect_to :back, :notice => "Courses was successfully added"
    
  end
    
end

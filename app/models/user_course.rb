class UserCourse < ActiveRecord::Base
	validates_uniqueness_of :user_id, :scope => [:course_id]
	belongs_to :user
	belongs_to :course
  belongs_to :assigned_user_course, :class_name => 'User', :foreign_key => 'created_by_id'
end

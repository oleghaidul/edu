class StudentGroupCourse < ActiveRecord::Base

  belongs_to :student_group
  belongs_to :course

end

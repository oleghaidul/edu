class StudentGroup < ActiveRecord::Base

  has_many :users, :as => :students

  has_many :student_group_courses
  has_many :courses, :through => :student_group_courses

end

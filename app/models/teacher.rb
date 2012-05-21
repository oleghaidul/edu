class Teacher < ActiveRecord::Base
  has_many :student_groups
  belongs_to :user
end

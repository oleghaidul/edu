class Course < ActiveRecord::Base
	belongs_to :category
	has_many :user_courses
	has_many :users, :through => :user_courses

	has_many :lessons, :dependent => :destroy
end

class Lesson < ActiveRecord::Base
  belongs_to :course
  has_many :user_lessons
  has_many :users, :through => :user_lessons
  has_many :testings
end

class User < ActiveRecord::Base

  has_many :assigned_user_courses, :class_name => 'UserCourse', :foreign_key => 'created_by_id', :inverse_of => :user_course
  has_many :assigned_courses, :source => :assigned_user_course, :through => :assigned_user_courses

  has_many :teachers

  belongs_to :student_group

  has_many :user_courses
  has_many :courses, :through => :user_courses

  has_many :user_lessons
  has_many :lessons, :through => :user_lessons

  has_many :user_questions
  has_many :questions, :through => :user_questions
    
  has_many :user_testings
  has_many :testings, :through => :user_testings

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :user_courses
end

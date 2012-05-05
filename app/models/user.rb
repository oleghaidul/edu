class User < ActiveRecord::Base

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
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role
end

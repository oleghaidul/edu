class Testing < ActiveRecord::Base
  has_many :questions
  has_many :answers, :through => :questions

  has_many :user_testings
  has_many :users, :through => :user_testings
  
  belongs_to :lesson
end

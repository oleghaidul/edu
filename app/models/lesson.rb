class Lesson < ActiveRecord::Base
  belongs_to :course
  has_many :user_lessons
  has_many :users, :through => :user_lessons
  has_many :testings
  has_many :videos
  has_many :documents

  def next
    course.lessons.where("id > ?", id).first
  end

  def prev
    course.lessons.where("id < ?", id).first
  end
end

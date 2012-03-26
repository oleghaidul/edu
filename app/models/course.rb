class Course < ActiveRecord::Base
  belongs_to :category
  has_many :user_courses
  has_many :users, :through => :user_courses

  has_many :lessons, :dependent => :destroy

  has_many :user_testings
  has_many :testings, :through => :user_testings

  has_many :user_lessons

  has_many :videos, :through => :lessons
  has_many :documents, :through => :lessons

  searchable do
    text :name, :content, :description
    text :lessons do
      lessons.map(&:name)
    end
    text :category do
      category.name
    end
    text :videos do
      videos.map(&:title)
    end
    text :documents do
      documents.map(&:name)
    end
  end
end

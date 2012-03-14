class Question < ActiveRecord::Base
  belongs_to :testing
  has_many :answers

  has_many :user_questions
  has_many :questions, :through => :user_questions

  def next
    testing.questions.where("id > ?", id).first
  end

  def prev
    testing.questions.where("id < ?", id).first
  end
  
end

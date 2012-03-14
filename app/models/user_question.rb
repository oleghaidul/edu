class UserQuestion < ActiveRecord::Base
	validates_uniqueness_of :user_id, :scope => [:question_id]
  belongs_to :user
  belongs_to :question
end

class UserTesting < ActiveRecord::Base
	validates_uniqueness_of :user_id, :scope => [:testing_id]
  belongs_to :user
  belongs_to :testing
  belongs_to :course
end

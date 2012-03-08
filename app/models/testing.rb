class Testing < ActiveRecord::Base
  has_many :questions
  belongs_to :lesson
end

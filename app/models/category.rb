class Category < ActiveRecord::Base
  has_many :courses, :dependent => :nullify

end

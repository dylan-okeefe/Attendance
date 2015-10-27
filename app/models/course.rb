class Course < ActiveRecord::Base
  has_many :students, through: :attendances
end

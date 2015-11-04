class Course < ActiveRecord::Base
	has_many :instructor_courses
	has_many :instructors 
  has_many :students, through: :attendances
  reverse_geocoded_by :latitude, :longitude
end

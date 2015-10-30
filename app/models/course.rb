class Course < ActiveRecord::Base
  has_many :student_courses
  has_many :students, through: :student_courses, class_name: 'Student'
  accepts_nested_attributes_for :student_courses
  accepts_nested_attributes_for :students
  reverse_geocoded_by :latitude, :longitude
end

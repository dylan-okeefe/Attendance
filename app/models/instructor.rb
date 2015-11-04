class Instructor < ActiveRecord::Base
	has_many :instructor_courses
  has_many :courses, through: :instructor_courses
  has_many :notes
  belongs_to :admin
end

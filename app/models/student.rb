class Student < ActiveRecord::Base
  has_many :attendances
  has_many :student_courses
  has_many :courses, through: :student_courses
  has_many :notes
  belongs_to :user
end

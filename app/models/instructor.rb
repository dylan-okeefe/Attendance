class Instructor < ActiveRecord::Base
  has_many :classes, through: :instructor_courses
  has_many :notes
  belongs_to :admin
end

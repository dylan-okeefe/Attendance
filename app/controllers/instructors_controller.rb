class InstructorsController < ApplicationController
  has_many :classes, through: :instructor_courses
  has_many :notes
end

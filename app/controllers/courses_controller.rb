class CoursesController < ApplicationController
  has_many :students, through: :attendences
end

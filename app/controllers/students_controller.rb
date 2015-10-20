class StudentsController < ApplicationController
  has_many :classes, through: :attendences
  has_many :notes
end

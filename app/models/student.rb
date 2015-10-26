class Student < ActiveRecord::Base
  has_many :attendences
  has_many :classes, through: :attendences
  has_many :notes
end

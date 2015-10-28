class Student < ActiveRecord::Base
  has_many :classes, through: :Attendances
  has_many :notes
  belongs_to :user
end

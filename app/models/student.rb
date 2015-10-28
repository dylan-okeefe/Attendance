class Student < ActiveRecord::Base
  has_many :attendances
  has_many :classes, through: :attendances
  has_many :notes
  belongs_to :user

end

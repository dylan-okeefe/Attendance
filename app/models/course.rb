class Course < ActiveRecord::Base
  has_many :students, through: :attendances
  reverse_geocoded_by :latitude, :longitude
end

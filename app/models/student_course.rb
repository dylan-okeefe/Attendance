class StudentCourse < ActiveRecord::Base
  belongs_to :student 
  belongs_to :course

  accepts_nested_attributes_for :student, reject_if: :all_blank
end

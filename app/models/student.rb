class Student < ActiveRecord::Base
  has_many :attendances
  has_many :student_courses
  has_many :courses, through: :student_courses
  has_many :notes
  belongs_to :user


  def is_late?
    t = Time.now
    late_range = Range.new(
              Time.local(t.year, t.month, t.day, 9, 01),
              Time.local(t.year, t.month, t.day, 9, 15)
              )
    t == late_range
  end

  def render_json
    json_data = {}
    json_data['name'] = self.first_name
  	json_data
  end

end

class Course < ActiveRecord::Base
  has_many :student_courses
  has_many :students, through: :student_courses, class_name: 'Student'
  accepts_nested_attributes_for :student_courses
  accepts_nested_attributes_for :students
  reverse_geocoded_by :latitude, :longitude


  def render_json
#binding.pry
      late_students = Student.all()#students for specific course
      absent_students = []
      present_students = []
      json_data = {}
      json_data['name'] = self.name 
      json_data['parent'] = 'Courses'
      json_data['children'] = [
              {
                    'name': 'Present',
                    'children': []
                    },
             
              {
                    'name': 'Late',
                    'children': late_students.map {|s| s.render_json }
                    },  
             
              {
                    'name': 'Absent',
                    'children': []
              }
        ]
              
        json_data.to_json
      end
    end








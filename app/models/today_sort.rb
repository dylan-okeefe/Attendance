class TodaySort
  attr_reader :today_data

  def initialize(course_id)
    @course_id = course_id
    # create hash to hold the student data
    @today_data = {here: [], late: [], out: []} 
  end

  def grab_attendances
    # grab all of the attendance data for that class at that day
    @attendances = Attendance.where(created_at: (Time.zone.now.beginning_of_day..Time.zone.now.end_of_day), course_id: @course_id)
  end

  def sort_students
    # check the present and late columns and put the students in the correct array
    @attendances.each do |attendance|
      if attendance.present == false
        @today_data[:out] << attendance.student.first_name + " " + attendance.student.last_name
      elsif attendance.late == true 
        @today_data[:late] << attendance.student.first_name + " " + attendance.student.last_name
      else
        @today_data[:here] << attendance.student.first_name + " " + attendance.student.last_name
      end
    end
  end

  def run
    grab_attendances
    sort_students
    @today_data
  end
end
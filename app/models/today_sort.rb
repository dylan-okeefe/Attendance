class TodaySort
  attr_reader :today_data

  def initialize(attendances = [])
    @attendances = attendances
    @today_data = {here: [], late: [], out: []} 
  end

  def sort_students
    @attendances.each do |attendance|
      if attendance.present == false
        @today_data[:out] << attendance.student.first_name + " " + attendance.student.last_name
      elsif attendance.late == true 
        @today_data[:late] << attendance.student.first_name + " " + attendance.student.last_name
      else
        @today_data[:here] << attendance.student.first_name + " " + attendance.student.last_name
      end
    end
    @today_data
  end
end
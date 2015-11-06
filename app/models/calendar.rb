class Calendar
  attr_reader :table_data

 def initialize(course_id, range)
  @course_id = course_id
  @range = range
  @table_data = {}
 end

 def grab_attendances
  # get all attendances for the week
    @attendances = Attendance.where(created_at: @range, course_id: @course_id)
 end

 def get_names
  # get all the student names for the class
  @attendances.each do |attendance|
    @table_data[attendance.student_id] = {name: "#{attendance.student.first_name} #{attendance.student.last_name}"} if @table_data[attendance.student_id].nil?
  end
 end

 def get_week
  # enter the check in time or absence for each student and sort it by day
    @attendances.each do |attendance|
      if attendance.created_at.to_date.monday? 
        if attendance.present == true 
          @table_data[attendance.student_id][:monday] = attendance.created_at.strftime("%l:%M %p")
        elsif 
          @table_data[attendance.student_id][:monday] = "Out"
        end
      elsif attendance.created_at.to_date.tuesday?
        if attendance.present == true 
          @table_data[attendance.student_id][:tuesday] = attendance.created_at.strftime("%l:%M %p")
        elsif 
          @table_data[attendance.student_id][:tuesday] = "Out"
        end
      elsif attendance.created_at.to_date.wednesday?
        if attendance.present == true 
          @table_data[attendance.student_id][:wednesday] = attendance.created_at.strftime("%l:%M %p")
        elsif 
          @table_data[attendance.student_id][:wednesday] = "Out"
        end
      elsif attendance.created_at.to_date.thursday?
        if attendance.present == true 
          @table_data[attendance.student_id][:thursday] = attendance.created_at.strftime("%l:%M %p")
        elsif 
          @table_data[attendance.student_id][:thursday] = "Out"
        end
      elsif attendance.created_at.to_date.friday?
        if attendance.present == true 
          @table_data[attendance.student_id][:friday] = attendance.created_at.strftime("%l:%M %p")
        elsif 
          @table_data[attendance.student_id][:friday] = "Out"
        end
      end
    end
  end

  def run
    grab_attendances
    get_names
    get_week
    @table_data
  end

end 



 #  @table.each do |row|
 #    @attendances.each do |attendance|
 #      if attendance.student_id == row[:student_id] && attendance.created_at.to_date.monday?
 #        row[:monday] = attendance.created_at.strftime(""%l:%M %p"")
 #      end
 #    end
 #  end
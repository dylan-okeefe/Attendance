class Calander

 def initialize(attandances = [])
  @attendances = attendances
  @table_data = {}
 end

 def get_names
  @attendances.each do |attendance|
    @table_data[attendance.student_id] = {name: "#{attendance.student.first_name} #{attendance.student.last_name}"} if @table_data[attendance.student_id].nil?
  end
  binding.pry
 end

 # def get_monday
 #  @table.each do |row|
 #    @attendances.each do |attendance|
 #      if attendance.student_id == row[:student_id] && attendance.created_at.to_date.monday?
 #        row[:monday] = attendance.created_at.strftime(""%l:%M %p"")
 #      end
 #    end
 #  end

 #  @attendances.each do |attendance|
 #    @table[attendance.student_id] 

 #  end

 # end
end 
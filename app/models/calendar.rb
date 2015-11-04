class Calendar
  attr_reader :table_data

 def initialize(attendances = [])
  @attendances = attendances
  @table_data = {}
 end

 def get_names
  @attendances.each do |attendance|
    @table_data[attendance.student_id] = {name: "#{attendance.student.first_name} #{attendance.student.last_name}"} if @table_data[attendance.student_id].nil?
  end
 end

 def get_week
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
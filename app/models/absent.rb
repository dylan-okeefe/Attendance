class Absent

  def find_present_students
    # create array to hold present students
    @present = []
    # grab all of the attendences already created for the day and the course
    today = Attendance.where(created_at: (Time.zone.now.beginning_of_day..Time.zone.now.end_of_day), course_id: @course.id)
    # iterate through them and put the students id in the present array
    today.each do |attendance|
      @present << attendance.student_id
    end
  end

  def find_absent_students
    # create an array to hold the absent students
    @absent = []
    # grab all of the StudentCourses for the course and put them in the absent array if not in the present array
    StudentCourse.where(course_id: @course.id).each do |student_course|
      @absent << student_course.student_id if !@present.include?(student_course.student_id)
    end
    @absent.uniq!
  end

  def create_absences
    # iterate over all of the absent student ids and create a attendance record with present: false for them
    @absent.each do |student_id|
      Attendance.new(course_id: @course.id, student_id: student_id, present: false, late: true).save
    end 
  end

  def multiple_courses
    # grab all of the courses and run each step for each
    Course.all.each do |course|
      @course = course
      find_present_students
      find_absent_students
      create_absences
    end
  end

  def run
    multiple_courses
  end

end
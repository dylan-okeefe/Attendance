class AttendancesController < ApplicationController

  def index
    @attendances = Attendance.all
  end

  def show
    if user_signed_in?
    @attendances = Attendance.select(current_user.student_id)
    @attendances = Attendance.select(current_admin.course_id)
    present = @attendances.where(:present=>true).count();
    late = @attendances.where(:late=>true).count();
    attendance_hash = {
      "data": {
        "content": [
          {
            "label": "Present",
            "value": present
          },
          {
            "label": "Lates",
            "value": late
          }
        ]
      } 
    }
    render json: attendance_hash.to_json
  end
  end

  def new

    @attendance = Attendance.new
  end

  def edit
  end

  def create
    @course_id = session[:course_id]
    @student_id = session[:student_id]
    
    if StudentCourse.where(student_id: @student_id, course_id: @course_id).empty?
      @student_course = StudentCourse.new(student_id: @student_id, course_id: @course_id)
      @student_course.save
    end
    #put logic for late. 
    #right now the students controller checks for present (btwn 7 and 9:15)
    #in here i need to check if 'created_at' is after 9 so late can be true.
    @attendance = Attendance.new(course_id: @course_id, student_id: @student_id, late: session[:late], present: true)
    respond_to do |format|
      if @attendance.save
        format.html { redirect_to @attendance}
        format.json { render :show, status: :created, location: @attendance }
      else
        format.html { render :new }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to @attendance}
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { render :edit }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @attendance.destroy
    
    respond_to do |format|
      format.html { redirect_to attendances_url, notice: 'attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_attendance
      @attendance = attendance.find(params[:id])
    end


    def attendance_params
      params.require(:attendance).permit[:course_id, :student_id, :present, :late]
    end
end

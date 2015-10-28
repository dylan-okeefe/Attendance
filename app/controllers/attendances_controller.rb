class AttendancesController < ApplicationController

  def index
    @attendances = Attendance.all
  end

  def show
  end

  def new
    @attendance = Attendance.new
  end

  def edit
  end

  def create
    # binding.pry
    @course_id = session[:course_id]
    @student_id = session[:student_id]
    # binding.pry
    @attendance = Attendance.new(course_id: @course_id, student_id: @student_id)

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to @attendance, notice: 'attendance was successfully created.' }
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
        format.html { redirect_to @attendance, notice: 'attendance was successfully updated.' }
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
      format.html { redirect_to Attendances_url, notice: 'attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_attendance
      @attendance = attendance.find(params[:id])
    end


    def attendance_params
      params.require(:attendance).permit[:course_id, :student_id]
    end

end

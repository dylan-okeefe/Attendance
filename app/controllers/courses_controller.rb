class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    # @admin = Admin.find_by(:id => @course.instructor)
    week = Range.new(
                Time.local(2015, 10, 25),
                Time.local(2015, 10, 31)
                )
    @attendances = Attendance.where(created_at: week, course_id: @course.id)
    @students = []
    @monday = []
    @tuesday = []
    @wednesday = []
    @thrusday = []
    @friday = []
    @attendances.each do |attendance|
      @students << attendance.student if !@students.include?(attendance.student)
      if attendance.created_at.to_date.monday?
        @monday << attendance
      elsif attendance.created_at.to_date.tuesday?
        @tuesday << attendance
      elsif attendance.created_at.to_date.wednesday?
        @wednesday << attendance
      elsif attendance.created_at.to_date.thursday?
        @thursday << attendance
      elsif attendance.created_at.to_date.friday?
        @friday << attendance
      end
    end
      # binding.pry

  end

  def new
    @course = Course.new
  end

  def edit
  end

  def manage
    @course = Course.find(params[:id])
    @student = Student.new
    @student_course = StudentCourse.new
  end

  def create
    @course = Course.create(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @course = Course.find(params[:id])
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_course
      @course = Course.find(params[:id])
    end


    def course_params
      params.require(:course).permit(:name, students_attributes: [:id, :first_name, :last_name, :_destroy])
    end
end

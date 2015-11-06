class CoursesController < ApplicationController
  before_action :set_course, only: :show

  def index
    @courses = Course.all
  end

  def show
    treeData = 
  {
    "name": "Course Name",
    "parent": "Courses",
    "children": [
      {
        "name": "In",
        "parent": "Courses",
        "children": [
          {
            "name": "Son of A - Present Students",
            "parent": "Level 2: A"
          },
        ]
      },
      {
        "name": "Level 2 B - Late  ",
        "parent": "Courses",
        "children":[
        {
            "name": "Son of B - Late Students",
            "parent": "Level 2: B"
          },
        ] 
      },
      {
        "name": "MH Level 2 C - Absent",
        "parent": "Courses",
        "children":[
        {
            "name": "Son of B - Absent Students",
            "parent": "Level 2: B"
          }
        ] 
      }
    ]
  }


    # render json: @course.render_json

    @today_data = TodaySort.new(params[:id]).run
  end

  def calendar
    # @admin = Admin.find_by(:id => @course.instructor)
    date1 = params[:dateone].to_date
    date2 = params[:datetwo].to_date
    week = Range.new(date1, date2)
    @table_data = Calendar.new(params[:id], week).run
  
    render layout: false
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

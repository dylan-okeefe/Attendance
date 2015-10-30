class StudentsController < ApplicationController

  def index
    if current_admin.nil?
      @lat_lng = cookies[:lat_lng].split("|")
      @classroom = Course.near([@lat_lng[0], @lat_lng[1]]).first
      @student = Student.find_by id: current_user.student_id
      if @classroom.distance < 0.2 && !(Attendance.where(["student_id = ?", current_user.student_id]).last.try(:created_at).try(:strftime, "%m%d%Y") == Time.now.strftime("%m%d%Y"))
        @clickable = true
        session[:course_id] = @classroom.id
        session[:student_id] = @student.id
      else 
        @clickable = false
      end
    end
  end

  def show
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.create(student_params)
    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_student
      @student = student.find(params[:id])
    end


    def student_params
      params.require(:student).permit(:first_name, :last_name, :image)
    end
end

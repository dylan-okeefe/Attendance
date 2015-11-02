class StudentsController < ApplicationController
  
  def index
    if user_signed_in?
      @lat_lng = cookies[:lat_lng].split("|")
      @classroom = Course.near([@lat_lng[0], @lat_lng[1]]).first
      @student = Student.find_by id: current_user.student_id
      t = Time.now
      range = Range.new(
          Time.local(t.year, t.month, t.day, 7),
          Time.local(t.year, t.month, t.day, 9, 00)
        )

      late_range = Range.new(
          Time.local(t.year, t.month, t.day, 9, 01),
          Time.local(t.year, t.month, t.day, 9, 15)
        )
      if @classroom.distance < 0.2 && t == range
      #   (Attendance.where(current_user.student_id).last.created_at.strftime("%m%d%Y") == Time.now.strftime("%m%d%Y"))
        session[:course_id] = @classroom.id
        session[:student_id] = @student.id
        # if @classroom.distance < 0.2 && t == late_range
        #   @clickable = true
        # end
        @clickable = true
      end
          # binding.pry
          #IN PROGRESS GUYS
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

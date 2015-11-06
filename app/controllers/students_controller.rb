class StudentsController < ApplicationController
  
  def index
    grab_location
    case user_or_admin?
    when nil
      redirect_to root_path
    when "user"
      current_student
      if close_to_class? && log_in_time?
        @clickable = true
        if is_late? 
          session[:late] = false
        else
          session[:present] = true
        end
        
        session[:course_id] = @classroom.id
        session[:student_id] = @student.id
        # is_late? ? session[:late] = true : session[:late] = true
      end
    when "admin"

    else
      redirect_to root_path
    end
    # binding.pry
  end

  def is_late?
    t = Time.zone.now
    start_time = Time.zone.parse('9:01am')
    end_time = start_time + 14.minute

    t.between?(start_time, end_time)
  end

  def log_in_time?
    t = Time.zone.now
    start_time = Time.zone.parse('7am')
    end_time = start_time + 9.hour + 15.minute
    
    t.between?(start_time, end_time)
  end

  def close_to_class?
    @classroom = Course.near([@lat_lng[0], @lat_lng[1]]).first
    @classroom.distance < 0.2
  end

  def grab_location
    @lat_lng = cookies[:lat_lng].split("|")
  end

  def current_student 
    @student = Student.find_by id: current_user.student_id
  end

  def user_or_admin?
    if user_signed_in?
      "user"
    elsif admin_signed_in?
      "admin"
    else
      nil
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
        format.html { redirect_to @student}
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

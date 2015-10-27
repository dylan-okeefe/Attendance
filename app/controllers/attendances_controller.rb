  class attendancesController < ApplicationController
  
  def index
    @attendances = Attendance.all
  end
  def show
    @attendances = Attendance.select(current_user.student_id)
    present = @attendances.where(:present=>true).count();
    late = @attendances.where(:late=>true).count();
    Attendance_hash = {
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
    render json: Attendance_hash.to_json
  end

  def new
    @Attendance = Attendance.new
  end

  def edit
  end

  def create

    @Attendance = Attendance.create(Attendance_params)

    respond_to do |format|
      if @Attendance.save
        format.html { redirect_to @Attendance, notice: 'Attendance was successfully created.' }
        format.json { render :show, status: :created, location: @Attendance }
      else
        format.html { render :new }
        format.json { render json: @Attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @Attendance.update(Attendance_params)
        format.html { redirect_to @Attendance, notice: 'Attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @Attendance }
      else
        format.html { render :edit }
        format.json { render json: @Attendance.errors, status: :unprocessable_entity }
      end
    end
  end
   binding.pry

  def destroy
    @Attendance.destroy
    respond_to do |format|
      format.html { redirect_to attendances_url, notice: 'Attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_Attendance
      @Attendance = Attendance.find(params[:id])
    end


    def Attendance_params
      params[:class_id, :student_id, :present, :late, :date, :time]
    end
end

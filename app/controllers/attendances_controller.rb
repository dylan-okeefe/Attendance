class attendancesController < ApplicationController
  
  def index
    @attendances = attendance.all
  end

  def show
    @attendances = attendance.select(current_user.student_id)
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

  def index
    @attendances = attendance.all
  end

  def show
  end

  def new
    @attendance = attendance.new
  end

  def edit
  end

  def create
    @attendance = attendance.create(attendance_params)
  
    @class_id = session[:class_id]
    @student_id = session[:student_id]
    @attendance = attendance.new(class_id: @class_id, student_id: @student_id)

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
      format.html { redirect_to attendances_url, notice: 'attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_attendance
      @attendance = attendance.find(params[:id])
    end


    def attendance_params
      params[:class_id, :student_id, :present, :late, :date, :time]
    end
end

  class AttendencesController < ApplicationController
  
  def index
    @attendences = Attendence.all
  end

  def show
    @attendences = Attendence.select(current_user.student_id)
    present = @attendences.where(:present=>true).count();
    late = @attendences.where(:late=>true).count();
    attendence_hash = {
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
    render json: attendence_hash.to_json
  end

  def new
    @attendence = Attendence.new
  end

  def edit
  end

  def create
    @attendence = Attendence.create(attendence_params)

    respond_to do |format|
      if @attendence.save
        format.html { redirect_to @attendence, notice: 'attendence was successfully created.' }
        format.json { render :show, status: :created, location: @attendence }
      else
        format.html { render :new }
        format.json { render json: @attendence.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @attendence.update(attendence_params)
        format.html { redirect_to @attendence, notice: 'attendence was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendence }
      else
        format.html { render :edit }
        format.json { render json: @attendence.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @attendence.destroy
    respond_to do |format|
      format.html { redirect_to attendences_url, notice: 'attendence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_attendence
      @attendence = Attendence.find(params[:id])
    end


    def attendence_params
      params[:class_id, :student_id, :present, :late, :date, :time]
    end
end

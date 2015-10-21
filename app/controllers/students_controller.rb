class StudentsController < ApplicationController

  def new
    @student = Student.new
  end

  def create

  end

  def show
    @student = Student.find(params[:id])
  end

  

end

class CoursesController < ApplicationController

	def index
    @courses = Course.all 
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end


  private 

    def set_course 
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:name)
    end
  
end

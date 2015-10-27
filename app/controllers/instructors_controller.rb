class InstructorsController < ApplicationController

<<<<<<< HEAD
	def index
		@instructor = Instructor.all
	end

	def new
	end

	

	def create
		@instructor = Instructor.new(instructor_params)

		respond_to do |format|
			if @instructor.save
				format.html { redirect_to @instructor, notice: 'New instructor has been successfully created.' }
				format json { render :show, status: :created, location: @instructor }
			else
				format.html { render :new } 
				format.json { render json: @instructor.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit 
	end

	def update
	end

	def destroy
	end

	private 

	def set_instructor 
		@instructor = Instructor.find(params[:id])
	end

	def instructor_params
		params.require(:instructor).permit(:name)
	end
=======
  def show
    @instructor = Instructor.find(params[:id])
  end

>>>>>>> master
end

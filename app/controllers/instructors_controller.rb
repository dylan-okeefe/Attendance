class InstructorsController < ApplicationController
  @@data = File.read("#{Rails.root}/public/instructor.json")

  

  def index
  	@instructors = Instructor.all
   # render :json => @@data
  end
   
  def show
     @instructor = Instructor.find(params[:id])
 #create hash for specific instructor here
 #instructor needs to have an association to the attendance 

     render:json => @@data
   end

  def new
    @instructor = Instructor.new
  end

  def edit 
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
  	

  def update
    @instructor = Instructor.find(parmas[:id])
  
    respond_to do |format|
      if @instructor.update(instructor_params)
          format.html { redirect_to @instructor, notice: 'Instructor was successfully updated.' }
          format.json { render :index, status: :updated, location: @instructor}
      else
          format.html { render :edit}
          format.json { render json: @instructor.erros, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @instructor.destroy
    respond_to do |format|
      format.html { redirect_to instructor_url, notice: 'Instructor was successfully removed.'}
      format.json { head :no_content }
    end
  end

	private 

		def set_instructor 
			@instructor = Instructor.find(params[:id])
		end

		def instructor_params
			params.require(:instructor).permit(:first_name, :last_name)
		end
end

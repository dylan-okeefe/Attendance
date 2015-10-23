class MyDevise::RegistrationsController < Devise::RegistrationsController

  def new
    super
    @student = Student.new
  end

  def create
    super

  end


end
class AdminsRegistrationController < Devise::RegistrationsController

  def create
    @instructor = Instructor.new(:first_name => sign_up_params[:first_name],:last_name => sign_up_params[:last_name])
    @instructor.save
    build_resource(sign_up_params, @instructor.id)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  private

  # Build a devise resource passing in the session. Useful to move
  # temporary session data to the newly created user.
  def build_resource(hash=nil, instructor_id=nil)
    hash[:instructor_id] = instructor_id
    self.resource = resource_class.new_with_session(hash || {}, session)
  end

  def sign_up_params
    params.require(:admin).permit(:first_name, :last_name, :email, :password, :password_confirmation, :instructor_id)
  end

  def account_update_params
    params.require(:admin).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end

end
class StaticController < ApplicationController
	# skip_before_action :authenticate_user!

	def home
		if user_signed_in?
			redirect_to :controller => :students
		elsif admin_signed_in?
			redirect_to :controller => :instructors
		end
	end

	def help
	end
end

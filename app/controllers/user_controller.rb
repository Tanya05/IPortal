class UserController < ApplicationController
	def home
		@user = current_user
	end

	def update
		@user = current_user
		if @user.update(current_user)
		    redirect_to @user
		else
		    render 'edit'
		end
	end
end
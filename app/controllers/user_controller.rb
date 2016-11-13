class UserController < ApplicationController
	def home
		@user = current_user
	end

	def profile
		@user = current_user
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		if @user.update(user_params)
		    redirect_to '/'
		else
		    render 'edit'
		end
	end

	private
	def user_params
		params.require(:user).permit(:bio, :name)
	end
end
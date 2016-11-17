class UserController < ApplicationController
	before_filter :is_first_sign_in?	

	def home
		@user = current_user
		@data = Ip.all
	end

	def new
		@user = User.new
	end

	def create
		@user=User.new(params[:user])
		@user.save
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

	def about
		@user = current_user
	end

	def earnings
		@user = current_user
	end

	private
	def user_params
		params.require(:user).permit(:bio, :name)
	end

	def is_first_sign_in?
    	unless current_user.sign_in_count == 1
      	flash[:error] = "Please Change your password"
     	redirect_to edit_user_registration_path
    end
end
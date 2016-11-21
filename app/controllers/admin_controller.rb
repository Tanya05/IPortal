class AdminController < ApplicationController
	before_filter :authorized?

	def home
		@user = current_user
	end

	def viewall
		@user = current_user
		@users = User.all
	end

	def user_destroy
		@user = User.find(params[:id])#parameters selected acc to ID
		@user.destroy#this instance destroyed

    	if @user.destroy
        	redirect_to admin_viewall_path, notice: "User deleted."
       	end	
    end

    def createuser
    	@user = User.new
    end

    def create
    	@user = User.create(create_params)
    	if @user.save
	    	flash[:notice] = "You created a new user!"
	    	flash[:color]= "valid"
	    else
	    	flash[:notice] = "Form is invalid"
	    	flash[:color]= "invalid"
	    end
	    redirect_to admin_createuser_path
	end



    private
  	def authorized?
    	unless !current_user.flag?
      	flash[:error] = "You are not authorized to view that page."
     	redirect_to root_path
    end

    def create_params
    	defaults = { password: "changethis", password_confirmation: "changethis" }
    	params.require(:user).permit(:name, :email).merge(defaults)
    end
  end
end

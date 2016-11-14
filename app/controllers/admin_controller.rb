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

    private
  	def authorized?
    	unless current_user.isAdmin?
      	flash[:error] = "You are not authorized to view that page."
     	redirect_to root_path
    end
  end
end

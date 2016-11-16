class IpController < ApplicationController
	def my_ips
		@user = current_user
		@data = Ip.all
	end

	def upload_ip
		@user = current_user
	end

<<<<<<< HEAD
	def ip_info
		@user = current_user
		@title = params[:title]
		@desc = params[:desc]
		@kind = params[:kind]
	end

	def update
	end

	def show
		@q = "%#{params[:query]}"
		@ips = Ip.where("name LIKE ?", @q)
		render 'index'
	end

	def license
=======
	def successful_upload
>>>>>>> d663d30592d505a316a80f3d5c46509af5ba4c5e
		@user = current_user
	end
end

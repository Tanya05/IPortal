class IpController < ApplicationController
	def my_ips
		@user = current_user
		@id = @user[:id]
		@usr = User.find(@id)
		@st = @usr.stakeholders.uniq
		@data = Ip.all
	end

	def upload_ip
		@user = current_user
	end

	def ip_info
		@user = current_user
		@data = Ip.find(params[:id])
	end

	def update
	end

	def show
		@q = "%#{params[:query]}"
		@ips = Ip.where("name LIKE ?", @q)
		render 'index'
	end

	def license

	end
	
	def successful_upload
		@user = current_user
	end
end

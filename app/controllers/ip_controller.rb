class IpController < ApplicationController
	def my_ips
		@user = current_user
		@data = Ip.all
	end

	def upload_ip
		@user = current_user
	end

	def successful_upload
		@user = current_user
	end
end

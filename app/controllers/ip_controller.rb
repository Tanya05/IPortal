class IpController < ApplicationController
	def view
		@data = Ip.all
	end
end

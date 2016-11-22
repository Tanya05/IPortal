class IpCommitteeController < ApplicationController

	def pending
		@user = current_user
		@data = Ip.all
	end

	def approvals
		@user = current_user
		@title = params[:title]
		@desc = params[:desc]
		@kind = params[:kind]
	end

end

class IpCommitteeController < ApplicationController

	def pending
		@user = current_user
		@data = Ip.all
	end

	def approvals
		@user = current_user
		@data = Ip.find(params[:id])
	end

	def update
		@user = current_user
		@data = Ip.find(params[:id])
		@count = @data.no_of_approvals+1
		@data.update_attribute(:no_of_approvals, @count)
		redirect_to ip_committee_approvals_path(@data)
	end

end

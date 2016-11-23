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
		@data.update_attribute(:approval_status, 1)
		redirect_to ip_committee_approvals_path(@data)
	end

	def disapprove
		@user = current_user
		@data = Ip.find(params[:id])
		@data.update_attribute(:approval_status, 0)
		redirect_to ip_committee_approvals_path(@data)
	end

end

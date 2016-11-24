class IpCommitteeController < ApplicationController
	 helper_method :is_pending

	def pending
		@user = current_user
		@data = Ip.all
	end

	def is_pending(data)
		@user = current_user
		if TempCommittee.exists?(data.id)
			@check = TempCommittee.where(:ip_id => data.id )
			if @check !=nil
			@check.each do |check|
				if check[:user_id] == @user[:id]
					return 1
				else 
					return 0
				end
			end
			end
		else
			@check = Stakeholder.where("ip_id = ?", data[:id] )
			@check.each do |check|
				if check[:user_id] == @user[:id]
					return 0
				else 
					return 1
				end
			end
		end

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

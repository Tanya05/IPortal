class IpCommitteeController < ApplicationController

	def pending
		@user = current_user
		@data = Ip.all
	end

	# def edit
	# 	@data = Ip.find(params[:id])
	# end

	# def update
 #  		@data = Ip.find(params[:id])
 # 		if @data.update(data_params)
 #    			redirect_to @data
 #  		else
 #    			render 'edit'
 #  		end
	# end


	def approvals
		@user = current_user
		@data = Ip.find(params[:id])
	end

	def update
		@user = current_user
		@data = Ip.find(params[:id])
		@data.update_attribute(:no_of_approvals, 1)
		redirect_to ip_committee_approvals_path(@data)
	end

end

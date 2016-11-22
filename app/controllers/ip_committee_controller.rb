class IpCommitteeController < ApplicationController

	def pending
		@user = current_user
	end

end

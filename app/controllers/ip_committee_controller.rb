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

	def upload_ipcm_check
      @ip=Ip.find(params[:id])
      @stakeholders=@ip.stakeholders
      @permanentCounter=0
      @temporaryCounter=0
      @i=0
      permanentarray=[]
      temporaryarray=[]
      arr=[]
      @stakeholders.each do |stakeholder|
        @usernew = User.find(stakeholder.user_id)
        if @usernew.flag==1
          @permanentCounter=@permanentCounter+1 ##########Count of perm members not stakeholders
          permanentarray<<@usernew
        elsif @usernew.flag==2
          @temporaryCounter=@temporaryCounter+1
        end
      end
      @stakeholders=@ip.stakeholders
      @userall = User.where(:flag=>2)
      @stakeholders.each do |stakeholder2|
        @userall.each do |oneuser|
        	if @permanentCounter>2
        		if stakeholder2.user_id!=oneuser.id
        			create_params = { ip_id: @ip.id, user_id: oneuser.id}
	          		@tempMember = TempCommittee.new(create_params)
	          		@tempMember.save ##########Count of temp members not stakeholders
	          		@permanentCounter=@permanentCounter-1
	          	end
	        end
	    end
	  end
      redirect_to root_path
      ###########For other case#####
      end


end

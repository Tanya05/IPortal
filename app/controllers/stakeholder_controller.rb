class StakeholderController < ApplicationController
	def index
    	@stake = Stakeholder.all
    	@user = current_user
	end

	def new
		@stake = Stakeholder.new
		@user = current_user
		@temp = 0
		@current_ip = Ip.find(params[:id])
	end

	def create
		@user = current_user
		@title = params[:title]
		@current_ip = Ip.find(params[:id])
		@stake = Stakeholder.new(stake_params)
		@stakeSum = Stakeholder.where(ip_id: @current_ip[:id]).sum(:percentage)
		@stakeSum = @stakeSum + @current_ip[:iiitbStake] + @stake[:percentage]
		if @stakeSum > 100 
			flash[:notice] = "Percentages not equal to 100. Change the last added stakeholder"
			@stake.destroy
			redirect_to stakeholder_new_path and return
		else
			@usr = User.where("name = ?", @stake[:name]).select(:id).take
			if @usr.blank?
				flash[:error] = "Invalid stakeholder"
				redirect_to stakeholder_new_path and return
			else
				@stake.update_attribute(:user_id,@usr[:id])
				@stake.update_attribute(:ip_id, @current_ip.id)
			end
			if @stake.save
      			redirect_to stakeholder_new_path
    		else
      			render "new"
    		end
		end
	end

	private 
		def stake_params
			params.require(:stakeholder).permit(:name, :ip_id, :user_id, :percentage, :isOwner, :test_var)
		end
end

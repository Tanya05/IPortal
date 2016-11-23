class StakeholderController < ApplicationController
	def index
    	@stake = Stakeholder.all
    	@user = current_user
	end

	def new
		@stake = Stakeholder.new
		@user = current_user
	end

	def create
		@user = current_user
		@title = params[:title]
		@current_ip = Ip.where("title = ?", @title).select(:id).take
		@stake = Stakeholder.new(stake_params)
		@usr = User.where("name = ?", @stake[:name]).select(:id).take
		if @usr.blank?
			flash[:error] = "Invalid stakeholder"
			redirect_to ip_new_stakeholder_path and return
		else
			@stake.update_attribute(:user_id,@usr[:id])
			@stake.update_attribute(:ip_id,'11')
		end
		
		if @stake.save
      		redirect_to ip_new_stakeholder_path
    	else
      		render "new"
    	end
	end

	def show

	end

	private 
		def stake_params
			params.require(:stakeholder).permit(:name, :ip_id, :user_id, :percentage, :isOwner)
		end
end

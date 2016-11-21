class ContractController < ApplicationController
	def new
		@user = current_user
		@contract = Contract.new
	end

	def create
		@user = current_user	
	end

	def update
		@user = current_user
		if @user.update(user_params)
		    redirect_to '/'
		else
		    render 'edit'
		end
	end
end

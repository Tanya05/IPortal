class ContractController < ApplicationController
	def new
		@user = current_user
		@contract = Contract.new
		@data = Ip.find(params[:id])
	end

	def create
		@user = current_user
		@data = Ip.find(params[:id])
		@contract = Contract.new(contract_params)
		@contract.save
		@ip = Ip.where("title = ?", @data.title).take
		@contract.update_attribute(:ip_id, @ip[:id])
		redirect_to new_contract_path(@data)
	end

	def update
		@user = current_user
		if @user.update(user_params)
		    redirect_to '/'
		else
		    render 'edit'
		end
	end
	private 
		def contract_params
			params.require(:contract).permit(:ip_id, :Type, :royalty)
		end
end

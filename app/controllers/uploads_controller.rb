class UploadsController < ApplicationController
	def index
    	@upload = Ip.all
    	@user = current_user
	end
 
	def new
    	@upload = Ip.new
    	@user = current_user
	end
 
	def create
    	@upload = Ip.new(upload_params)
 
    	if @upload.save
      		redirect_to ip_upload_ip_path, notice: "The upload #{@upload.title} has been uploaded."
    	else
      		render "new"
    	end
  	end
 
  	def destroy
    	@upload = Ip.find(params[:id])
    	@upload.destroy
    	redirect_to ip_upload_ip_path, notice:  "The upload #{@upload.title} has been deleted."
  	end
 
	private
  	def upload_params
    	params.require(:ip).permit(:title, :description,:Type, :uploads)
    	#private method so hackers can't access by sending requests like in sqlengine attacks
    	#only permitted values and not entire table made visible
  	end
end

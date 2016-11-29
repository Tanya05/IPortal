class AdminController < ApplicationController
	before_filter :authorized?

	def home
    @user = current_user
    @data = Ip.all
  end

  
  def profile
    @user = current_user
  end

	def viewall
		@user = current_user
		@users = User.all
	end

  def about
    @user = current_user
  end

  def earnings
    @user = current_user
  end

  def add_temp_ipc_member
    @user = User.find(params[:id])
    @user.update_attribute(:flag,2)
    redirect_to admin_viewall_path(@user)
  end

  def add_permanent_ipc_member
    @user = User.find(params[:id])
    @user.update_attribute(:flag,1)
    redirect_to admin_viewall_path(@user)
  end

  def remove_ipc_member
    @user = User.find(params[:id])
    @user.update_attribute(:flag, nil)
    redirect_to admin_viewall_path(@user)
  end

	def user_destroy
		@user = User.find(params[:id])#parameters selected acc to ID
		@user.destroy#this instance destroyed

    	if @user.destroy
        	redirect_to admin_viewall_path, notice: "User deleted."
       	end	
    end

    def createuser
    	@user = User.new
    end

    def create
    	@user = User.create(create_params)
      if create_params[:isIIITB]=="International Institute of Information Technology, Bangalore"
        @user.isIIITB=1
      else
        @user.isIIITB=0
      end
    	if @user.save
	    	flash[:notice] = "You created a new user!"
	    	flash[:color]= "valid"
	    else
	    	flash[:notice] = "Form was invalid, either username or email already exists!"
	    	flash[:color]= "invalid"
	    end
	    redirect_to admin_createuser_path
	end

    def conflict_ip
      @user = current_user
      @ip=Ip.where("approval_status > ?", 1)
    end

    def add_temp_members_page
      @user = current_user
      #@users = User.all
      @notusers=[]
      @notusers2=[]
      @ip=Ip.find(params[:id])
      @sts = @ip.stakeholders
      @sts.each do |st|
        @temp = User.find(st.user_id)
        @notusers.push(@temp)
      end
      @tempMembers = TempCommittee.where(:ip_id => @ip.id)
      @tempMembers.each do |tempMember|
        @temp = User.find(tempMember.user_id)
        @notusers2.push(@temp)
      end
      @user1 = User.all
      @user2 = @user1.reject{ |e| @notusers.include? e }
      @users = @user2.reject{ |e| @notusers2.include? e }
    end

    def add_temp_conflict_ip_members  
      @ip=Ip.find(params[:ipid])
      newApproval = @ip.approval_status
      userID = params[:user_id]
      @users = User.find(params[:user_id])
      @user=current_user
      if @ip.approval_status>20
        # @addUser = User.find
        # @ip=Ip.find(params[:id])
        create_params = { ip_id: @ip.id, user_id: userID}
        newApproval = newApproval-1
        @ip.update_attribute(:approval_status, newApproval)
        @tempMember = TempCommittee.new(create_params)
        if @tempMember.save
          redirect_to admin_add_temp_members_page_path(@ip)
        end
      else
        redirect_to admin_conflict_ip_path(@user)
      end

    end



    private
  	def authorized?
    	unless current_user.flag==0
      	flash[:error] = "You are not authorized to view that page."
     	redirect_to root_path
    end

    def create_params
    	defaults = { password: "changethis", password_confirmation: "changethis" }
    	params.require(:user).permit(:name, :email, :isIIITB).merge(defaults)
    end
  end
end

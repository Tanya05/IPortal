#overriding the sign up page
class RegistrationsController < Devise::RegistrationsController
  
  private #overriding params function
  def sign_up_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
  	params.require(:user).permit(:name, :bio, :email, :password, :password_confirmation, :current_password)
  end

  def profile_update_params
  	params.require(:user).permit(:name, :bio, :email)
  end
end 
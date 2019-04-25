
class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
      @user = User.new(user_params)
      if @user.save
          session[:user_id] = @user.id
          redirect_to data_packages_path 
      else
        flash[:message] = "Sorry, email is in use. Try again."
        render :new
      end
  end

  def show 
    redirect_to data_packages_path 
  end 

private 

  def user_params 
    params.require(:user).permit(:username, :email, :password, :uid, :provider)
  end 

end

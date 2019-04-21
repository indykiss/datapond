
class UsersController < ApplicationController


  #def welcome 
   # if !logged_in? 
    #    redirect_to '/login'
    #else 
     # @user = User.find(session[:current_user_id])
      #render :welcome 
   # end 
 # end 

  def new
    @user = User.new
  end

  def create
      @user = User.new(user_params)
      if @user.save
        #&& @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to data_packages_path 
      else
          render :new
      end
  end

  def show 
    @user = User.find_by_id([params[:id]])
  end 


private 

  def user_params 
    params.require(:user).permit(:username, :email, :password, :uid)
  end 

end

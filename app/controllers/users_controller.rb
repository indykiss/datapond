
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
      @user = User.find_by(email: params[:email])
      if @user 
        #&& @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to data_packages_index_path 
      else
          render :new
      end
  end

  def show 
    @user = User.find_by_id([params[:id]])
  end 


private 

  def user_params 
    params.permit(:username, :email, :password)
  end 

end

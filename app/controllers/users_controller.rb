
class UsersController < ApplicationController


  def welcome 
    if !logged_in? 
        redirect_to '/login'
    else 
      @user = User.find(session[:current_user_id])
      render :welcome 
    end 
  end 

  def login 

  end 

  def new
    @user = User.new 
  end

  def create 
    @user = User.new(user_params)

      if @user.save 
        session[:user_id] = @user.id
        redirect_to user_path(@user_id)
      else 
        redirect_to signup_path 
      end 
  end 

  def show 
  end 


private 


  def user_params 
    params.require(:user).permit(:username, :email, :password)
  end 

end




class FavoritesController < ApplicationController

#  skip_before_action :verify_authenticity_token


    def new
      @user = User.find(params[:user_id])


    end
  
    def create 
      @favorite = Favorite.new(favorite_params)
      @favorite.user_id = params(:user_id)



    end 

    def show 
      @favorite = Favorite.find(params[:id])

    end 
  
  
  
  private 
  
  
    def favorite_params 
      params.require(:favorite).permit(:user_id, :data_package_id)
    end 
  
  end
  
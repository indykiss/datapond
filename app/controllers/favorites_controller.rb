

class FavoritesController < ApplicationController

#  skip_before_action :verify_authenticity_token

    def new
      @favorite = Favorite.new(favorite_params)
    end
  
    def create 
      @favorite = Favorite.create(favorite_params)
      @favorite.user_id = current_user.id
      @favorte.data_package_id = 
      @favorite.save
      binding.pry

      if @favorite.valid?
          redirect_to favorite_path(@favorite)
        else                                                                      
         #redirect_to document_path
        end   
    end 

    def index 
      @favorites = Favorite.all
    end 

    def show 
      @favorite = Favorite.find(params[:id])
    end 
  
  
  private 
  
    def favorite_params 
      params.require(:favorite).permit(:user_id, :data_package_id, :notes)
    end 
  
  end
  
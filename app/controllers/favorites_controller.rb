

class FavoritesController < ApplicationController

#  skip_before_action :verify_authenticity_token

    def new
      @favorite = Favorite.new
    end
  
    def create 
      @favorite = Favorite.create(favorite_params)
      @favorite.user_id = current_user.id
      @favorite.save

      if @favorite.valid?
          redirect_to favorite_path(@favorite)
        else                                                                      
         #redirect_to document_path
        end   
    end 

    def index 
      @favorites = Favorite.all
      binding.pry
    end 

    def show 
      @favorite = Favorite.find(params[:id])
      @favorited_data_package = DataPackage.find(@favorite.data_package_id)
    end 
  
  private 
  
    def favorite_params 
      params.require(:favorite).permit(:user_id, :data_package_id, :notes)
    end 
  
  end
  
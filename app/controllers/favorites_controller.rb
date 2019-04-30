
class FavoritesController < ApplicationController

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
        render :new
      end   
  end 

  def index 
    #Favorite.joins(:data_packages, :favorites).where("(current_user.id == favorites.user_id) AND (data_packages.id == favorite.data_packages.id)" )
    #@jt = DataPackage.joins(:favorites).select(:name, :notes).where("favorites.data_package_id = data_packages.id")
    @favorites = Favorite.all
    @my_favorites = []
    @my_notes = []

    @favorites.each do  |favorite|
      if favorite.user_id == current_user.id
        @my_favorites << DataPackage.find_by_id(favorite.data_package_id) 
        @my_notes << favorite.notes
      end  
    end 
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
  

class DataPackagesController < ApplicationController

  def index        
    if params[:name]
      @data_packages = DataPackage.search_by_name(params[:name])
     # render :json => @documents
    else 
     @data_packages = DataPackage.all
     # render :json => @documents
    end 
  end

  def new
    @categories = Category.all
    @data_package = DataPackage.new
  end

  def create
    @categories = Category.all
    @data_package = DataPackage.new(data_package_params)
    @data_package.user_id = current_user.id
      if @data_package.save 
        redirect_to data_package_path(@data_package)
      else 
       render :new
      end 
  end

  def top_five 
    @data_packages = DataPackage.all
  end

  def most_favorited 
    @data_packages = DataPackage.all
  end 

  def show
    @data_package = DataPackage.find(params[:id])
    @category = Category.find_by_id(@data_package.category)
  end
  

private

  def data_package_params
    params.require(:data_package).permit(:name, :category_id, :user_id)
  end

end


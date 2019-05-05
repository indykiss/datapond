
class DataPackagesController < ApplicationController

  def index    
    # pull out the "here all data packages" and use the search 
    # look at this, weird that I use an instance method to refer to the DataPackage class     
    if params[:name]
      @data_packages = DataPackage.search_by_name(params[:name])
    else 
     @data_packages = DataPackage.all
    end 
  end

  def new
    @data_package = DataPackage.new
  end

  def create
    @data_package = DataPackage.new(data_package_params)
    @data_package.user_id = current_user.id
      if @data_package.save 
        redirect_to data_package_path(@data_package)
      else 
       render :new
      end 
  end

  def show
    @data_package = DataPackage.find(params[:id])
  end
  
private

  def data_package_params
    params.require(:data_package).permit(:name, :category, :user_id)
  end

end


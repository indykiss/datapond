
class DataPackagesController < ApplicationController

  def index
    @data_packages = DataPackage.all
  end

  def new
    @data_package = DataPackage.new
  end

  def create
    @data_package = DataPackage.create(data_package_params)
    @data_package.user_id = current_user.id
    @data_package.save
      if @data_package.valid?
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


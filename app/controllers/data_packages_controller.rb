
class DataPackagesController < ApplicationController


  def index
    @data_packages = DataPackage.all
  end

  def new
    @data_package = DataPackage.new
  end

  def create
    @data_package = DataPackage(data_package_params)

      if @data_package.save 
        #???
      else 
        #redirect_to 

      end 
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @data_package = DataPackage.find(params[:id])

    if current_user
      @data_package.destroy
    #  redirect_to ????
    end
  end

private

  def data_package_params
    require(:data_package),permit(:name, :category, :favorite, :user_id, :data_provider_id)
  end

end

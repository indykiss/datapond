
class DataPackagesController < ApplicationController


  def index
    @data_packages = DataPackage.all
  end

  def new
    @data_package = DataPackage.new
  end

  def create
    @data_package = DataPackage.find(data_package_params)

      if @data_package.save 
        redirect_to data_provider_path(@data_package.data_provider, @data_package)
      else 
       redirect_to new_data_provider_data_package_path(@data_provider)
      end 
  end

  def show
      @data_package = DataPackage.find(params[:id])
  end


  def update
    @data_package = DataPackage.find(params[:id])
    if @building.save
			redirect_to data_provider_data_package_path(@data_package.data_provider, @data_package)
		else 
      render :show 
    end 
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

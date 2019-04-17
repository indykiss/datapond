
class DataPackagesController < ApplicationController


  def index
    @data_packages = DataPackage.all
  end

  def new
    @data_package = DataPackage.new
  end


  # there's an issue with my IDs, as usual
  # I need my user to actually save
  # i think the user isn't saving because the top of the page
  # it says that there's an error, should say user's email

  #I'm currently working on getting the data package to save

  def create
    @data_package = DataPackage.new(data_package_params)
   #current_user.id == @data_package.user_id

      if @data_package
        redirect_to data_package_path(@data_package)
      else 
       render :new
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
      redirect_to root_path
    end
  end

private

  def data_package_params
    params.permit(:name, :category, :favorite, :user_id)
  end

end

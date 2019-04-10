class DataProvidersController < ApplicationController
  
  def index
    @data_providers = DataProvider.all 
  end

  def new
    @data_provider = DataProvider.new 
  end

  def create
    @data_provider = DataProvider.find_or_initialize_by(data_provider_params)
  end

  def show
    @data_provider = DataProvider.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

private 

  def data_provider_params 
    params.require(:data_provider).permit(:name, :type)
  end 
  
end

  
end

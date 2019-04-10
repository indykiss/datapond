class DataProvidersController < ApplicationController
  
  def index
    @data_providers = DataProvider.all 
  end

  def new
    @data_provider = DataProvider.new 
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

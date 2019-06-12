
class DataPackagesController < ApplicationController

  def index        
    if params[:name]
      @data_packages = DataPackage.search_by_name(params[:name])
    else 
     @data_packages = DataPackage.all
    end 
    respond_to do |format|
      format.html     
      format.json { render json: @data_packages} 
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
          render json: @data_package
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
    respond_to do |format|
      format.html     
      format.json { render json: @data_package} 
    end  
  end
  

private

  def data_package_params
    params.require(:data_package).permit(:name, :category_id, :user_id)
  end

end


# This create wasn't working for json but is better
# def create
#   @categories = Category.all
#   @data_package = DataPackage.new(data_package_params)
#   @data_package.user_id = current_user.id
 
#   respond_to do |format|
#     if @data_package.save
#       # issue: it's always hitting html format
#       # not json format
#       # fix that 
#       format.html do
#         redirect_to '/data_packages/new'
#       end
#       format.json { render json: @data_package.to_json }
#     else
#       format.html { render 'new'} ## Specify the format in which you are rendering "new" page
#       format.json { render json: @data_package } ## You might want to specify a json format as well
#     end
#   end

# end

  # redirect_to data_package_path(@data_package)

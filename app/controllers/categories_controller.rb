
class CategoriesController < ApplicationController
  
  def new 
    @category = Category.new
  end 

  def create
    @category = Category.create(category_params)
    if @category.save
        redirect_to categories_path
      else                                                                      
        render :new
      end    
  end 

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @selected = DataPackage.where(category: @category)
    @data_packages = DataPackage.all 
  end

  private 

  def category_params 
    params.require(:category).permit(:name)
  end 

end

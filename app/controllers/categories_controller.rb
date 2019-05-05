
class CategoriesController < ApplicationController
  
  def new 
    @category = Category.new
  end 

  def create 
    @category = Category.new(category_params)
 #   binding.pry
      if @category.save 
        redirect_to category_path(@category)
      else 
       render :new
      end 
  end 

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  private 

  def category_params 
    params.require(:category).permit(:name, :data_package_id)
  end 

end

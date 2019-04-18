
class DataPackagesController < ApplicationController


  def index
    @data_packages = DataPackage.all
  end

  def new
    @data_package = DataPackage.new
  end

# in my user's controller, is working: 
#  def create
 #   @user = User.new(user_params)
  #  if @user
      #&& @user.authenticate(params[:password])
   #     session[:user_id] = @user.id
    #    redirect_to data_packages_path 
  #  else
   #     render :new
   # end
# end

# now I need to fix current_user. the data package isn't
# thinking that there is an associated user ID
# but i fixed the users, so they're working now
  def create
    @current_user = User.find_by(username: params[:username])
    
    @data_package = DataPackage.create(data_package_params)
    @data_package.user_id = params[:user_id]

    #@data_package = current_user.data_packages.new(data_package_params)


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
      redirect_to data_package_path(@data_package)
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
    params.require(:data_package).permit(:name, :category, :favorite, :user_id)
  end

end

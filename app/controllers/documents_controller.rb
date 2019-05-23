
class DocumentsController < ApplicationController
    
  def index
    if params[:data_package_id]
      @documents = DataPackage.find(params[:data_package_id]).documents
      @data_package = DataPackage.find(params[:data_package_id])
    else 
      @documents = Document.all
    end
    respond_to do |format|
      format.html     
      format.json { render json: @documents} 
    end
  end

  def new
    @document = Document.new(data_package_id: params[:data_package_id])
  end

  def create
      @document = Document.create(document_params)
      @data_package_id = @document.data_package_id 
      @document.save
        if @document.valid?
          redirect_to data_package_document_path(@data_package_id, @document)
        else 
          render :new
        end   
  end

  def show
    @data_package = DataPackage.find(params[:data_package_id])
    @document = @data_package.documents.find(params[:id])
  end

private 

  def document_params
    params.require(:document).permit(:name, :raw_data, :data_package_id)
  end 
  
end

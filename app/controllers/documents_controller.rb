
class DocumentsController < ApplicationController
  
  def index
    @documents = Document.all 
  end

  def new
    @document = Document.new
  end


  def create
    @document = Document.find_or_initialize_by(document_params)
  end

  def show
    @document = Document.new
  end

  def update
  end

  def destroy
  end

  private 

  def document_params
    params.require(:document).permit(:name, :raw_data, :data_package_id)
  end 
  
end

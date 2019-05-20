
class DocumentSerializer < ActiveModel::Serializer 
    attributes :id, :name, :raw_data 
    belongs_to :data_package

end 
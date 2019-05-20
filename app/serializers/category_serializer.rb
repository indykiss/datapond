
class CategorySerializer < ActiveModel::Serializer 
    attributes :id, :name 
    has_many :data_packages
    has_many :documents

end 

class DataPackageSerializer < ActiveModel::Serializer 
    attributes :id, :name 

    #belongs_to :user 
    belongs_to :category
    has_many :documents
    has_many :favorites
    #has_many :users, through: :favorites


end 

class FavoriteSerializer < ActiveModel::Serializer 
    attributes :id, :notes 
    belongs_to :user
    belongs_to :data_package

end 
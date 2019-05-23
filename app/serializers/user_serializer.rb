
class UserSerializer < ActiveModel::Serializer 
    attributes :id, :name, :email
    has_many :data_packages
    # might not need both of these: 
    has_many :favorites
    has_many :favorited_data_packages, through: :favorites, source: :data_package


end 
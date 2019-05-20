
class UserSerializer < ActiveModel::Serializer 
    attributes :id, :name, :email
    has_many :data_packages
    has_many :favorites
    # how to serialize the favorited_data_packages source ? 
    # has_many :favorited_data_packages, through: :favorites, source: :data_package


end 
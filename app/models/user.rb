
class User < ApplicationRecord
    has_many :data_packages
    has_many :favorites
    has_many :favorited_data_packages, through: :favorites, source: :data_package
    # need to change user.favorited_data_packages to match the new name
    # in views/ controller
    
    has_many :documents, through: :data_packages
    validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 80 }
    has_secure_password

    def data_package_with_most_favs
        DataPackage.joins(:favorites).group("data_package_id").order("data_package_id.count")
    end 


end

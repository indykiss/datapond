
class User < ApplicationRecord
    has_many :data_packages 
    has_many :documents, through: :data_packages
    validates :email, uniqueness: true
    has_secure_password

    
end


class User < ApplicationRecord
    has_many :data_packages 
    has_many :favorites
    has_many :documents, through: :data_packages
    validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 80 }
    has_secure_password

end


class User < ApplicationRecord
    has_many :data_packages
    has_many :favorites
    # users have many fav_dat_packs through favorite: 
    has_many :favorited_data_packages, through: :favorites, source: :data_package
    # validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 80 }
    has_secure_password validations: false
    validates :password, presence: true, length: { minimum: 1 }


end

# remember to use .favorited_data_packages

# implicit:
# has_many :documents, through: :data_packages

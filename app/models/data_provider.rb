
class DataProvder < ApplicationRecord
    has_many :data_packages
    has_many :users, through: :data_packages
    validates :name, uniqueness: true 

    
end

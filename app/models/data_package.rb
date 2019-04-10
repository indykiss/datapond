
class DataPackage < ApplicationRecord
    has_many :documents 
    belongs_to :user 
    belongs_to :data_provider 
    validates :name 
    accepts_nested_attributes_for :documents 

end

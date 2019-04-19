
class DataPackage < ApplicationRecord
    has_many :documents 
    belongs_to :user 
    #validates :name 
    accepts_nested_attributes_for :documents 

end

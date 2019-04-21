
class DataPackage < ApplicationRecord
    belongs_to :user 
    has_many :documents
    validates_presence_of :name 
    accepts_nested_attributes_for :documents 

end

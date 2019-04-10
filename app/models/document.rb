
class Document < ApplicationRecord
    belongs_to :data_packages
    validates_presence_of :name 

    
end

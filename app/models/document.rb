
class Document < ApplicationRecord
    belongs_to :data_package
    validates_presence_of :name 

    
end

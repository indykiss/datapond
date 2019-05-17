
class Document < ApplicationRecord
    belongs_to :data_package
    validates_presence_of :name 
    
    scope :descending_order, -> {order("name ASC")}

end


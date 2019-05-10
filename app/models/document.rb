
class Document < ApplicationRecord
    belongs_to :data_package
#    belongs_to :category
    #has_many :users, through: :data_packages
    validates_presence_of :name 
    scope :descending_order, -> {order("name ASC")}

    #need join table between doc & data package
    

end

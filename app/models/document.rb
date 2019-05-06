
class Document < ApplicationRecord
    belongs_to :data_package
    has_many :users, through: :data_packages
    validates_presence_of :name 
    scope :descending_order, -> {order("name ASC")}


end

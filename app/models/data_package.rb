
class DataPackage < ApplicationRecord
    belongs_to :user 
    has_many :documents
    has_many :favorites
    validates_presence_of :name 
    accepts_nested_attributes_for :documents 
    scope :bloomberg, -> {where(name: "Bloomberg")}
    scope :reuters, -> {where(name: "Reuters")}
    scope :capiq, -> {where(name: "CapIQ")}

end

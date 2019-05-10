
class DataPackage < ApplicationRecord
    belongs_to :user 
    
    belongs_to :category
    has_many :documents
    has_many :favorites
    validates_presence_of :name 
#make

    # catgory can be a model, categories has many data packages, then many users through data packages. join table!
    # searchable through category 
    accepts_nested_attributes_for :documents 
    scope :bloomberg, -> {where(name: "Bloomberg")}
    scope :reuters, -> {where(name: "Reuters")}
    scope :capiq, -> {where(name: "CapIQ")}
    scope :search_by_name, -> (search_name){where("name LIKE ?", search_name)}
  
end

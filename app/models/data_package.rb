
class DataPackage < ApplicationRecord
    belongs_to :user 
    belongs_to :category
    has_many :documents
    has_many :favorites
    has_many :users, through: :favorites

    validates_presence_of :name 
    accepts_nested_attributes_for :documents 

    # maybe ok:
    scope :bloomberg, -> {where(name: "Bloomberg")}
    scope :reuters, -> {where(name: "Reuters")}
    scope :capiq, -> {where(name: "CapIQ")}
    scope :search_by_name, -> (search_name){where("name LIKE ?", search_name)}
  


end


# Ex of source:
# belongs_to :creator, foreign_key: :user_id, class_name: "User"
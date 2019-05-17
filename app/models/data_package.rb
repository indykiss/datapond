
class DataPackage < ApplicationRecord
    belongs_to :user 
    belongs_to :category
    has_many :documents
    has_many :favorites
    # data_packs have many users through favorite: 
    has_many :users, through: :favorites

    validates_presence_of :name 
    accepts_nested_attributes_for :documents 

    scope :bloomberg, -> {where(name: "Bloomberg")}
    scope :reuters, -> {where(name: "Reuters")}
    scope :capiq, -> {where(name: "CapIQ")}
    scope :search_by_name, -> (search_name){where("name LIKE ?", search_name)}

    scope :top_five, -> {joins(:favorites).group(:id).order("Count(favorites.id) DESC").limit(5)}
    


end
















# Ex of source:
# belongs_to :creator, foreign_key: :user_id, class_name: "User"
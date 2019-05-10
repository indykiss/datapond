
class Category < ApplicationRecord
    has_many :data_packages
    has_many :documents
    has_many :users, through: :data_packages
    #might need to switch this a bit, where documents belong to categories instead of data packs

    validates :name, presence: true, uniqueness: { case_sensitive: false }

end 
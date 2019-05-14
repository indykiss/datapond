
class Category < ApplicationRecord
    has_many :data_packages
    has_many :documents
    validates :name, presence: true, uniqueness: { case_sensitive: false }

end 
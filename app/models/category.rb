
class Category < ApplicationRecord
    has_many :data_packages
    has_many :users, through: :data_packages

    validates :name, presence: true, uniqueness: { case_sensitive: false }

end 
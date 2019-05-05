
class Category < ApplicationRecord
    belongs_to :data_package
    has_many :users, through: :data_packages
    validates :name, presence: true, uniqueness: { case_sensitive: false }

end 
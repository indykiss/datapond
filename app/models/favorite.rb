
class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :data_package
    has_many :users, through: :data_packages
    validates_presence_of :notes 

# add in a page to see all the people who've favorited this
# data package show page, all the people who favorited this
# add scope for which data packages had most favorites
# remember to use .favorited_data_packages

end

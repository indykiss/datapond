
class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :data_package

    validates_presence_of :notes 

end

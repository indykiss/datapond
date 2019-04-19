

class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :data_package

    
end

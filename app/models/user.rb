class User < ApplicationRecord
    has_many :trips
    has_many :locations, through: :trips
    has_many :activities, through: :locations
end

class Trip < ApplicationRecord
  has_many :locations
  has_many :activities, through: :locations

  belongs_to :user
end

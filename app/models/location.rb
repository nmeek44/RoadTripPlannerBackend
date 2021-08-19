class Location < ApplicationRecord
  has_many :activities
  belongs_to :trip
end

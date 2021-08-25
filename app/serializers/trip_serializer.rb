class TripSerializer < ActiveModel::Serializer
  attributes :id, :name, :startCity, :startLatitude, :startLongitude, :user_id, :locations
end

class TripSerializer < ActiveModel::Serializer
  attributes :id, :name, :startLatitude, :startLongitude, :user_id
end

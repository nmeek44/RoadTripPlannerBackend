class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :locationLatitude, :locationLongitude, :trip_id
end

class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :image, :description, :actLatitude, :actLongitude, :location_id
end

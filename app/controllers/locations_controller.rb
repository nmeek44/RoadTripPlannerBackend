class LocationsController < ApplicationController

    def index
        locations = Locations.all
        render json: locations
    end

    def show
        location = Location.find(params[:id])
        render json: location
    end

    def create
        new_location = Location.create!(new_location_params)
        results = Geocoder.search(new_location.name)
        byebug
        new_location.locationLatitude = results.first.coordinates[0]
        new_location.locationLongitude = results.first.coordinates[1]
        render json: new_location
    end

    private

    def new_location_params
        params.permit(:name, :locationLatitude, :locationlongitude :location_id)
    end
end

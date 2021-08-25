class LocationsController < ApplicationController
before_action :authenticate, only: [:index, :show, :create, :update, :destroy, :new_starting_location]

    def index
        locations = Locations.all
        render json: locations
    end

    def show
        location = Location.find(params[:id])
        render json: location
    end

    def create
        # byebug
        results = Geocoder.search(cityName)
        citycoordinates = results.first.coordinates

        new_location = Location.new(new_location_params)
        new_location.locationLatitude = citycoordinates[0]
        new_location.locationLongitude = citycoordinates[1]
        new_location.save

        render json: new_location, status: :created
    rescue ActiveRecord::RecordInvalid => e
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

    def new_starting_location
        new_starting_location = Location.create!(new_starting_location_params)

        render json: new_starting_location, status: :created
    rescue ActiveRecord::RecordInvalid => e
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

    private

    def cityName
        params[:location][:name]
    end

    def new_starting_location_params
        params.require(:location).permit(:name, :locationLatitude, :locationLongitude, :trip_id)
    end

    def new_location_params
        params.require(:location).permit(:name, :trip_id)
    end
end

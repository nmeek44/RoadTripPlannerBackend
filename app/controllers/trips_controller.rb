class TripsController < ApplicationController
before_action :authenticate, only: [:index, :show, :create, :update, :destroy]
    # skip_before_action :authenticate, only: [:index, :create]

    def index
        trips = Trip.all
        render json: trips
    end

    def show
        trip = Trip.find(params[:id])
        render json: trip
    end

    def create
        results = Geocoder.search(startCityName)
        citycoordinates = results.first.coordinates

        new_trip = Trip.new(new_trip_params)
        new_trip.startLatitude = citycoordinates[0]
        new_trip.startLongitude = citycoordinates[1]
        new_trip.user_id = @current_user.id 
        new_trip.save

        render json: new_trip, status: :created
    rescue ActiveRecord::RecordInvalid => e
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

    def update
        trip = Trip.find(params[:id])
        trip.update(update_trip_params)
        render json: trip
    end

    def destroy
        trip = Trip.find(params[:id])
        trip.destroy

        render json: { message: "Trip successfully Deleted" }, status: :no_content
    rescue ActiveRecord::RecordInvalid => e
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

    private


    def startCityName
        params[:trip][:startCity]
    end


    def new_trip_params
        params.require(:trip).permit(:name, :startCity)
    end

    def update_trip_params
        params.permit(:name, :startCity, :startLatitude, :startLongitude)
    end
    
end

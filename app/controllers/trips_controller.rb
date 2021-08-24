class TripsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
before_action :authenticate, only: [:index, :show, :create, :update, :destroy]

    def index
        trips = Trip.all
        render json: trips
    end

    def show
        trip = Trip.find(params[:id])
        render json: trip
    end

    def create
        # results = Geocoder.search(new)
        new_trip = Trip.new(new_trip_params)
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
    end

    private

    def render_not_found_response
        render json: { error: "Trip not found"}, status: :render_not_found_response
    end

    def new_trip_params
        params.require(:trip).permit(:name, :startLatitude, :startLongitude)
    end

    def update_trip_params
        params.permit(:name, :startLatitue, :startLongitude)
    end
    
end

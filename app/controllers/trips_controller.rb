class TripsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        trips = Trip.all
        render json: trips
    end

    def show
        trip = Trip.find(params[:id])
        render json: trip
    end

    def create
        new_trip = Trip.create!(new_trip_params)
        render json: new_trip, status: :created_at
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
        params.permit(:name, :startLatitude, :startLongitude, :user_id)
    end

    def update_trip_params
        params.permit(:name, :startLatitue, :startLongitude)
    end
    
end

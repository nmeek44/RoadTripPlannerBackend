class UsersController < ApplicationController
# rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    skip_before_action :authorized, only: [:create, :login]

    def login
        # byebug
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:password])
            render json: @user
        else
            render_not_found_response
        end
    end
    
    # def me
    #     user = User.first
    #     render json: user
    # end

    def index
        users = User.all
        render json: users
    end

    def show
        render json: { user: UserSerializer.new(current_user)}, status: :accepted
    end

    def create
        @user = User.create(new_user_params)
        if @user.valid?
            @token = encode_token(user_id: @user.id)
            render json: {user: UserSerializer.new(@user), jwt: @token}, status: :created
        else
            render json: { error: 'failed to create user' }, status: :unprocessable_entity
        end
        # render json: new_user, status: :created
        # rescue ActiveRecord::RecordInvalid => e
        #     render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

    def update
        user = User.find(params[:id])
        user.update(update_user_params)
        render json: user
    end
    
    def destroy
        user = User.find(params[:id])
        user.destroy
    end


    private

    def render_not_found_response
        render json: {error: "User not found"}, status: :render+_render_not_found_response
    end

    def new_user_params
        params.require(:user).permit(:username, :password)
    end

    def update_user_params
        params.permit(:username, :password, :trips, :locations, :activities)
    end
end

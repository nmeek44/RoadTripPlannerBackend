class AuthController < ApplicationController
    skip_before_action :authenticate, only: [:create, :login]

    def create
        @user = User.create(user_login_params)
        if @user.valid?
            token = encode_token({ user_id: @user.id})
            render json: { user: UserSerializer.new(@user), jwt: token }, status: :created
        else
            render json: { message: 'failed to create user' }, status: :unprocessable_entity
        end
    end

    def login
        @user = User.find_by(username: user_login_params[:username])
        if @user && @user.authenticate(user_login_params[:password])
            token = encode_token({user_id: @user.id})
            render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
        else
            render json: {error: "Username or Password is incorrect"}, status: :unauthorized
        end
    end

    private

    def user_login_params
        # params { user: {username: 'Chandler Bing', password: 'hi' } }
        params.require(:user).permit(:username, :password)
    end

    
end

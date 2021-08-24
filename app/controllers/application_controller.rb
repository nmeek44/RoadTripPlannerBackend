class ApplicationController < ActionController::API
    before_action :authenticate
   
    def authenticate
        auth_header = request.headers["Authorization"]
        token = auth_header.split.last
        payload = JWT.decode(token, 'my_s3cr3t', true, {algorithm: 'HS256'})[0]
        @current_user= User.find_by(id: payload["user_id"])
    rescue
        render json: { errors: ["Not Authorized"] }, status: :unauthorized
    end

    def encode_token(payload)
        # payload => {username:'Nick',password:'123'}
        JWT.encode(payload, 'my_s3cr3t')
        #jwt string: "asdfklajdsf"
    end

    def auth_header
        # {Authorization: 'Bearer <token>'}
        request.headers['Authorization']
    end

    def decoded_token
        # token => "asdlfkjasdf"
        if auth_header
            token = auth_header.split('')[1]
            begin
                JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')[0]
                # JWT.decode => [{"username"=>"Nick", "password"=>"123"}, {"alg"=>"HS256"}]
                # [0] gives us the payload {"username"=>"Nick", "password"=>"123"}
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_user
        if decoded_token
            # decoded_token=> [{"username"=>"Nick", "password"=>"123"}, {"alg"=>"HS256"}]
            # or nil if we can't decode the token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        !!current_user
    end

end

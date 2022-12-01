class ApplicationController < ActionController::API
    # before_action :authenticate, except: :generate_token
    include ActionController::Helpers
    include Response
    helper_method :current_user 

    def authenticate
        header = request.headers['Authorization']
        header = header.split(' ').last if header

        begin
            decoded = JwtToken.decode(header)
            @current_user = Author.find(decoded[:author_id])
        rescue ActiveRecord::RecordNotFound => e
            render json: {error: e.message, message: "An error occured. Try again."}, status: 401
        rescue JWT::DecodeError => e
            render json: {error: e.message, message: "Error: Login again to generate a new token"}, status: 401
        end
    end
end

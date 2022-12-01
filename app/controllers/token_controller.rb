class TokenController < ApplicationController


    def generate_token
        @author = Author.find_by_email(params[:email])
        if @author && Author.authenticate(params[:email], params[:password])
            token = JwtToken.encode(author_id: @author.id, email: @author.email, name: @author.name)
            time = Time.now + 24.hours.to_i
            render json: {token: token, expiry: time.strftime("%d-%m-%Y %H:%M")}, status: 200
        else
            render json: {error: 'Wrong email or password'}, status: 401
        end
    end
end

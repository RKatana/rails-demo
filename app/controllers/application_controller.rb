class ApplicationController < ActionController::API
    
    include ActionController::Helpers
    include Response
    helper_method :current_user 

    def current_user #We use this action to monitor who is logged in based on the session
        if session[:author_id]
            @current_user = Author.find(session[:author_id])
        end
    end

    def authorize
        if !current_user
          json_response({message:'You are not authorized to perform this action. You have to log in'}, status = 401)
        end
    end
end

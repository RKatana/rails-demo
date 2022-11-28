require "active_support/concern"

module Response
    extend ActiveSupport::Concern

    included do
        def json_response(object, status = :ok)
            render json: object, status: status
        end

        rescue_from ActiveRecord::RecordInvalid do |exception|
            json_response({message: exception.message}, status = 422)
        end
        
        rescue_from ActiveRecord::RecordNotFound do |exception|
            json_response({message: exception.message}, status = 404)
        end
    end

end
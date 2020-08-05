module Api
    module V1

    class PrivateController < ActionController::API
        include Secured
    
        def index
            # // grab token from header
            # // decode token
            # // get email... 
            # // profit
        render json: user_id
        end
    
        def private_scoped
        render json: { message: 'Hello from a private endpoint! You need to be authenticated and have a scope of read:messages to see this.' }
        end
    end
    end
end
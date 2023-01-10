class ApplicationController < ActionController::API
    # Rescue all most exceptions of application controller children
    rescue_from ArgumentError, with: :handle_invalid_input_exception
    rescue_from TypeError, with: :handle_invalid_input_exception
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from Exceptions::AuthenticationError, with: :handle_unauthenticated
    rescue_from Exceptions::EmptyInputException, with: :handle_empty_input_exception
    rescue_from Exceptions::InvalidInputException, with: :handle_invalid_input_exception
    rescue_from Exceptions::InvalidConstellationException, with: :handle_invalid_constellation_exception
    rescue_from Exceptions::ThirdPartyAPIException, with: :handle_third_party_exception

    private
    # handle empty input exception
    def handle_empty_input_exception e
        render json: {"empty input" => "Please enter valid input"}, status: :bad_request
    end

    # handles when record is not found
    def record_not_found 
        render json: {'error' => "User doesn't exist, please pass valid user or create one"}, status: :not_found
    end

    # handles unauthorized errors
    def handle_unauthenticated
        render json: {'Login Error' => "Please login to access this api."}, status: :unauthorized
    end
    
    # handles invalid request exception
    def handle_invalid_input_exception e
        render json: {"invalid input" => e}, status: :bad_request
    end
    
    #handle invalid constellation name exception
    def handle_invalid_constellation_exception
        render json: {'error' => 'Invalid constellation name. please pass valid constellation name', 
          'message' => 'you can get constellation names by calling /api/v1/satcat/'}, status: :bad_request
    end

    # handle third party application exceptions
    def handle_third_party_exception e
        render json: {"empty input" => e.message}, status: e.status
    end
end

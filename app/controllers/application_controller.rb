class ApplicationController < ActionController::API
    # Rescue all most exceptions of application controller children
    rescue_from ArgumentError, with: :handle_invalid_input_exception
    rescue_from TypeError, with: :handle_invalid_input_exception
    rescue_from Exceptions::EmptyInputException, with: :handle_empty_input_exception
    rescue_from Exceptions::InvalidInputException, with: :handle_invalid_input_exception
    rescue_from Exceptions::InvalidConstellationException, with: :handle_invalid_constellation_exception
    rescue_from Exceptions::ThirdPartyAPIException, with: :handle_third_party_exception

    # handle empty input exception
    def handle_empty_input_exception e
        render json: {"empty input" => "Please enter valid input"}, status: :bad_request
    end
    
      # handles invalid request exception
    def handle_invalid_input_exception e
        render json: {"invalid input" => e}, status: :bad_request
    end
    
    #handle invalid constellation name exception
    def handle_invalid_constellation_exception
        render json: {'error' => 'Invalid constellation name. please pass valid constellation name', 
          'message' => 'you can get constellation names by calling /satcat/info'}, status: :bad_request
    end

    # handle third party application exceptions
    def handle_third_party_exception e
        render json: {"empty input" => e.message}, status: e.status
    end
end

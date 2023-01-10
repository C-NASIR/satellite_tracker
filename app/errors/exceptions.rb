module Exceptions
  class EmptyInputException < StandardError 
  end
  class InvalidInputException < StandardError
  end
  class InvalidConstellationException < StandardError
  end
  class AuthenticationError < StandardError
  end
  class UserAlreadyExistsError < StandardError
  end
  # Exception for third party application
  class ThirdPartyAPIException < StandardError
    def initialize(message, status)
      super(message)
      @status = status

    end
    
    # Returns the appropriate status code based on the one that is thrown
    def status
      return :ok if @status == 200
      return :unauthorized if @status == 401
      return :internal_server_error
    end
  end
end
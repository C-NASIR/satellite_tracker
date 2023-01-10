class AuthenticationTokenService
    HMAC_SECRET = '$ecret@Key'
    ALGORITHM_TYPE = 'HS256'

    # encodes a user id to a jwt
    def self.call(user_id)
        payload = {user_id: user_id}

        JWT.encode payload, HMAC_SECRET, ALGORITHM_TYPE
    end

    # decodes a user if from jwt
    def self.decode(token)
        decoded_token = JWT.decode token, HMAC_SECRET, true, { algorithm: ALGORITHM_TYPE }
        decoded_token[0]['user_id']
    end
end
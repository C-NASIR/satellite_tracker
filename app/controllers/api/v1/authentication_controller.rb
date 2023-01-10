module Api
    module V1 
      class AuthenticationController < ApplicationController
        # rescue params missing errors
        rescue_from ActionController::ParameterMissing, with: :parameter_missing
        rescue_from Exceptions::UserAlreadyExistsError, with: :user_already_exists_error

        #this end point signs up a user 
        def signup
            username =  params.require(:username)
            password = params.require(:password)

            raise Exceptions::UserAlreadyExistsError if User.exists?(username: username)

            user = User.create!(username: username, password: password)
            token = AuthenticationTokenService.encode(user.id)

            render json: {token: token}, status: :created
        end

        #this end points login in the user 
        def signin
            user = User.find_by!(username: params.require(:username))

            raise Exceptions::AuthenticationError unless user.authenticate(params.require(:password))

            token = AuthenticationTokenService.encode(user.id)
            render json: {token: token}, status: :created
        end

        private 
        # creates a user property that can we use throughout the class
        def user
            @user ||= User.find_by!(username: params.require(:username))
        end

        # handles when parameter is missing 
        def parameter_missing e
            render json: {'error' => e.message}, status: :unprocessable_entity
        end

        #handles when user already exists 
        def user_already_exists_error
            render json: {'error' => "The username is taken, please use another one"}, status: :unprocessable_entity
        end
       end     
    end
  end
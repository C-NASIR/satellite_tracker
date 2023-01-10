module Api
    module V1 
      class AuthenticationController < ApplicationController
        rescue_from ActionController::ParameterMissing, with: :parameter_missing
        rescue_from Exceptions::AuthenticationError, with: :handle_unauthenticated

        #this end points creates user 
        def create
            user = User.find_by!(username: params.require(:username))

            raise Exceptions::AuthenticationError unless user.authenticate(params.require(:password))

            token = AuthenticationTokenService.call(user.id)
            render json: {token: token}, status: :created
        end

        private 
        def user
            @user ||= User.find_by!(username: params.require(:username))
        end

        def parameter_missing e
            render json: {'error' => e.message}, status: :unprocessable_entity
        end

        def handle_unauthenticated
            render json: {'error' => "Please pass valid username and password"}, status: :unauthorized
        end
       end     
    end
  end
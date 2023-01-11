module Api
  module V1 
    class SatcatController < ApplicationController
      # include helper modules needed
      include ActionController::HttpAuthentication::Token
      include ApplicationHelper, SatcatHelper, DataHelper

      # Authenticates before all end points except info
      before_action :authenticate, except: [ :info ]
     
       # This action returns the api decumentation
      def info
        result = get_endpoint_documentation
        render json: result, status: :ok
      end
     
      # This action retruns an object of a given NORAD CAT ID 
      def noradcatid
        id = params.require(:id)
        error = validate_noradcat_id(id) # checking if the id is empty and returns bad_request if it is 
        url = ENV['BASE_QUERY_URL'] + ENV['NORAD_CAT_ID_QUERY'] + "#{id}" + ENV['SHARED_ENDING']
        response = call_api(url, "noradcatid_id_#{id}")
        render json: response, status: :ok
      end
     
      # This action returns an object of a given INTLDES id
      def Intldes
        id = params.require(:id)
        validate_Intldes_id id
        url = ENV['BASE_QUERY_URL'] + ENV['INTLDES_QUERY'] + "#{id}" + ENV['SHARED_ENDING']
        response = call_api(url, "Intldes_#{id}")
        render json: response, status: :ok
      end
     
      # This action returns launched objects in a given date 
      def launch
        date = params.require(:date)
        validate_launch_date date
        url = ENV['BASE_QUERY_URL'] + ENV['LAUNCH_QUERY'] + "/#{date}" + ENV['SHARED_ENDING']
        response = call_api(url, "launch_date_#{date}")
        render json: response, status: :ok
      end
     
      # This action returns satellites in a given constellation
      def constellation
        name = params.require(:name)
        limit = params[:limit] == nil ? 50 : params[:limit]
        offset = params[:offset] == nil ? 0 : params[:offset]
     
        # validate the name
        validate_constellation_name name
     
        url = ENV['BASE_QUERY_URL'] + ENV['CONSTELLATION_QUERY'] + "#{name}/limit/#{limit},#{offset}" + ENV['SHARED_ENDING']
        response = call_api(url, "constellation_#{name}_#{limit}_#{offset}")
        render json: response, status: :ok
      end

      private 
      # Authorization using: Bearer <token>
      def authenticate
        token, _options = token_and_options(request)
        raise Exceptions::AuthenticationError if token == nil

        user_id = AuthenticationTokenService.decode(token)
        User.find(user_id)
      end
     end     
  end
end
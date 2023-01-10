# This helper has all the small methods we need in satcat_controller like validation of end-points
module SatcatHelper
     #check if norad id is valid 
    def validate_noradcat_id id
        # check if the input is empty 
        raise Exceptions::EmptyInputException if is_empty id  

         num = Integer(id)
         # check if the number is positive 
         raise Exceptions::InvalidInputException if num <= 0
    end

    #check if the intldes id is valid 
    def validate_Intldes_id id
        # check if the id is empty 
        raise Exceptions::EmptyInputException if is_empty id  
        raise Exceptions::InvalidInputException if is_invalid id
    end

    def validate_launch_date date
        # check if the date is empty
        raise Exceptions::EmptyInputException if is_empty date
        raise Exceptions::InvalidInputException if is_invalid date

        # check if the date is a correctly formatted date 
        year, month, day = date.split('-')
        year, month, day = Integer(year), Integer(month), Integer(day)
        raise Exceptions::InvalidInputException if Date.valid_date?(year, month, year)
    end

    #check if valid constellation name is passed
    def validate_constellation_name name
        raise Exceptions::EmptyInputException if is_empty name 
        raise Exceptions::InvalidInputException if is_invalid name

        names_hash = get_constellations_name_hash
        # raise error if it is invalid constellation name

        raise Exceptions::InvalidConstellationException if !names_hash[name.upcase]
    end

    # This functions calls any given api and caches the result, so not to call the api again
    def call_api(query, hash)
        Rails.cache.fetch(hash, expires_in: 12.hours) do
            # NOTICE: I am forgetting an exception here. In-case the API call fails 
            response =  Excon.post(ENV['LOGIN_URL'],
                :body => ENV['LOGIN_CREDENTIALS'] + "&query=#{query}",
                :headers => { "Content-Type" => "application/x-www-form-urlencoded" })
    
            #raise exception if third party appllication throws an error
            message, status = response.body, response.status
            raise Exceptions::ThirdPartyAPIException.new(message, status) if status != 200
    
            #return data 
            response.body
        end
     end
end

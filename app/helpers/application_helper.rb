module ApplicationHelper
    #checkes if valid input is passed
    def is_empty input
        input == nil
     end

     #checkes if input is valid
     def is_invalid input 
     input.length < 1
     end  
end

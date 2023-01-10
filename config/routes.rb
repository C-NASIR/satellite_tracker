Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do 
    namespace :v1 do 
      get 'satcat/info'
      get 'satcat/noradcatid'
      get 'satcat/launch'
      get 'satcat/constellation'
      get 'satcat/Intldes'

      # Authentication
      post 'signin', to: 'authentication#signin'
      post 'signup', to: 'authentication#signup'
    end
  end
end

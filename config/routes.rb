Rails.application.routes.draw do
  get 'satcat/index'
  get 'satcat/noradcatid'
  get 'satcat/launch'
  get 'satcat/constellation'
  get 'satcat/Intldes'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

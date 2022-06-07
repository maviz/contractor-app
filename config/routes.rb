Rails.application.routes.draw do
  resources :payment_reqs
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "payment_reqs#index"
end

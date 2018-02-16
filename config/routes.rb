Rails.application.routes.draw do
  resources :contacts
  
  get '/update_cities/:state_name', to: 'contacts#update_cities'
  get 'search', to: "search#contacts"

  root 'contacts#index'
end

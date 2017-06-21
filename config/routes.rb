Rails.application.routes.draw do
  resources :contacts

  get '/update_cities/:state_name', to: 'contacts#update_cities'

  root 'contacts#index'
end

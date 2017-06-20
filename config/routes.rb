Rails.application.routes.draw do
  resources :contacts

  get 'update_cities', to: 'contacts#update_cities'
  
  root 'contacts#index'
end

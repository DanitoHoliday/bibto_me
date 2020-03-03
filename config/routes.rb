Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'registration', to: "pages#registration", as: :registration
  post 'update-registration', to: 'tags#update_registration', as: :update_registration
  get 'confirmation', to: 'tags#successful_registration', as: :successful_registration
  resources :tags
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

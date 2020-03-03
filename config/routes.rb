Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

<<<<<<< HEAD
  resources :tags, only: [:edit, :update]
  resources :finders, only: [:new, :create]
  get '/finders/thank-you', to: 'finders#thank_you', as: :finder_thank_you
  get '/tags/return', to: 'tags#return', as: :tags_return

=======
  get 'registration', to: "pages#registration", as: :registration
  post 'update-registration', to: 'tags#update_registration', as: :update_registration
  get 'confirmation', to: 'tags#successful_registration', as: :successful_registration
  resources :tags, only: [:show, :edit, :update]
  resources :finders, only: [:new, :create]
  get '/finders/thank-you', to: 'finders#thank_you', as: :finder_thank_you
>>>>>>> master
  # get '/thank-you', to: 'pages#thank_you', as: :thank_you
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root to: 'pages#home'

  get 'components', to: 'pages#components', as: :components
  get 'tag_registration', to: "tags#registration", as: :tag_registration
  post 'update-registration', to: 'tags#update_registration', as: :update_registration
  get 'confirmation', to: 'tags#successful_registration', as: :successful_registration
  get 'scan-code', to: 'tags#scan_code', as: :scan_code
  resources :tags, only: [:show, :edit, :update]

  resources :finders, only: [:new, :create]
  get '/finders/thank-you', to: 'finders#thank_you', as: :finder_thank_you
  get '/pages/return_item', to: 'pages#return_item', as: :pages_return_item
  post 'return_tag_verification', to: 'tags#return_tag_verification', as: :return_tag_verification
  # get '/thank-you', to: 'pages#thank_you', as: :thank_you
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

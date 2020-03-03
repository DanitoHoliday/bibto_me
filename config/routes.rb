Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'components',         to: 'pages#components',    as: :components
  resources :tags, only: [:show, :edit, :update]
  resources :finders, only: [:new, :create]
  get '/finders/thank-you', to: 'finders#thank_you', as: :finder_thank_you

  # get '/thank-you', to: 'pages#thank_you', as: :thank_you
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root to: 'pages#home'

  get 'split_users', to: 'splitters#split_users', as: :split_users
  get 'components', to: 'pages#components', as: :components

  get 'tag_registration_input', to: "tag_registers#register_input", as: :register_input
  resources :tag_registers, only: [:edit, :update]
  get 'register_success', to: 'tag_registers#successful_registration', as: :register_success

  resources :tag_finders, only: [:new, :create]
  get 'tag_return_input', to: 'tag_finders#finder_input', as: :finder_input
  get '/finders/thank-you', to: 'tag_finders#thank_you', as: :finder_thank_you
  # get '/thank-you', to: 'pages#thank_you', as: :thank_you
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


# link_to scan_code_path(qr_code: 'kdlkjfd')

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  resources :posts, only: [:index, :show, :new, :create]
  resources :user_session, only: [:create]

  get 'login', to: 'user_session#new'
  get 'logout', to: 'user_session#logout'
  get 'home', to: 'posts#index'

end

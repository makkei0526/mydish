Rails.application.routes.draw do
  get 'home', to: 'home#index'
  get 'mypage', to: 'users#me'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dishes#index'
  resources :users, only: %i[new create]
  resources :dishes
  resources :comments, only: %i[create destroy]
end

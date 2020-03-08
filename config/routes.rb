Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'dishes#index'
  get 'dishes', to: 'dishes#index'
  get 'dishes/new', to: 'dishes#new'
  post 'dishes', to: 'dishes#create'

end

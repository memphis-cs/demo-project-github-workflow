Rails.application.routes.draw do

  root to: 'pages#home'

  get 'home', to: 'pages#home', as: 'home'
  get 'alice', to: 'pages#alice', as: 'alice'
  get 'bob', to: 'pages#bob', as: 'bob'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'pages#home'
  
  get '/about', to: 'pages#about', as: '/about'
  get '/help', to: 'pages#help', as: '/help'
  get '/test', to: 'todos#index', as: '/index'
  
  resources :todos  do
    resources :comments
  end
  resources :users
  
end

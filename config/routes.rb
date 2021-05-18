Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items
  post 'user_registration' ,to:'users#create'
end

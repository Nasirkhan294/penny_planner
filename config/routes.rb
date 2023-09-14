Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :groups, only: %i[index show new create destroy]
  resources :expenses, only: %i[index show new create destroy]
end

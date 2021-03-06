Rails.application.routes.draw do
  get 'email/index'
  devise_for :users
  root to: "email#index"
  resources :tasks, except: [:show]
  resources :email, only: [:index, :show, :edit, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

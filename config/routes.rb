Rails.application.routes.draw do
  get 'welcome/index'

  resources :sessions, only: [:create, :destroy]
  resources :users, only: [:create, :show] do
  	resources :relationships, only: [:create, :destroy]
  end
  resources :rooms, only: [:create, :update, :show, :destroy]
  resources :games, only: [:create, :destroy]
  
  post "/games/input" => "games#input", as: "input"

  post "/users/search" => "users#search", as: "search"

  get "/sign_up" => "users#new", as: "sign_up"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"

  root "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html  	
end

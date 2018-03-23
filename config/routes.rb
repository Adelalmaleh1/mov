Rails.application.routes.draw do
# match '/users',   to: 'users#index',   via: 'get'
# match '/users/:id',   to: 'users#show',   via: 'get'
get 'user/:id' => 'users#show', as: :user
get 'users' => 'users#index', as: :user_index



  resources :categories
    devise_for :users

devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
end
resources :movies do
    put :favorite, on: :member
end
    root 'welcome#index'  
end

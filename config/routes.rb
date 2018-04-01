Rails.application.routes.draw do

  # resources :reviews
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
get 'user/:id' => 'users#show', as: :user
get 'users' => 'users#index', as: :user_index

resources :movies do
    resources :reviews, except: [:index, :show]
    resources :favorites, only: [:create, :destroy]
end
resources :categories

devise_for :users

devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
end

root 'welcome#index'  

end

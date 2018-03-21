Rails.application.routes.draw do
  resources :categories
    devise_for :users

devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
end
resources :movies
    root 'welcome#index'  
end

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
  #get "/", to: "articles#index"
  #get "/articles/website", to: "website#index"
  #get "/articles/:id", to: "articles#show"
  resources :articles do
    resources :comments
    collection do
      get :published 
    end
  end

  namespace :api do
    namespace :v1 do
      resources :articles
    end
  end
end

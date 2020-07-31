Rails.application.routes.draw do
  namespace :api do
    
    namespace :v1 do

      get '/test', to: 'users#test'

      resources :users
    end

    namespace :v1 do
      resources :scorecards
    end

  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

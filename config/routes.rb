Rails.application.routes.draw do

  # resources :private

  namespace :api do
    
    namespace :v1 do

      # get '/users/:id/holes_played', to: 'users#holesPlayed'

      # resources :users
      get '/users/me', to: 'users#me'
    end

    namespace :v1 do
      resources :scorecards
    end

    namespace :v1 do
      resources :private
    end

  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :wishes
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, except: [:new] do
        resources :wishes
      end
    end
  end
end

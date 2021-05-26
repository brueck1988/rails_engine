Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do
        resources :items, controller: :merchant_items, only: :index
      end
    end
  end
  
  namespace :api do
    namespace :v1 do
      resources :items do
        resources :merchant, controller: :items_merchant, only: :index
      end
    end
  end
end

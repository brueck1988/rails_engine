# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :merchants, only: %i[index show] do
        resources :items, controller: :merchant_items, only: :index
      end
      resources :items, only: %i[index show destroy create update] do
        resources :merchant, controller: :items_merchant, only: :index
      end
      namespace :revenue do
        resources :merchants, only: :index
      end
    end
  end
end

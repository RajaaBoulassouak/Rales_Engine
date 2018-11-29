Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      namespace :merchants do 
        get '/most_revenue' => 'most_revenue#index'
        get '/most_items' => 'most_items#index'
      end 
      resources :merchants, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :transactions, only: [:index, :show]
    end 
  end 
end
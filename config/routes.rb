Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      namespace :merchants do 
        get '/most_revenue' => 'most_revenue#index'
        get '/most_items'   => 'most_items#index'
        get '/revenue'      => 'revenue#index'
        get '/:id/favorite_customer' => 'favorite_customer#show'
        get '/:id/revenue'  => 'revenue#show'
        get '/find'         => 'find#show'
        get '/find_all'     => 'find#index'
        get '/random'       => 'random#show'
        get '/:id/items'    => 'merchant_items#show'
        get '/:id/invoices' => 'merchant_invoices#show'
      end 
      
      namespace :customers do 
        get '/find'             => 'find#show'
        get '/find_all'         => 'find#index'
        get '/random'           => 'random#show'
        get '/:id/invoices'     => 'customer_invoices#show'
        get '/:id/transactions' => 'customer_transactions#show'
      end 
      
      namespace :items do 
        get '/find'              => 'find#show'
        get '/find_all'          => 'find#index'
        get '/random'            => 'random#show'
        get '/:id/invoice_items' => 'item_invoice_items#show'
        get '/:id/merchant'      => 'item_merchant#show'
      end 
      
      namespace :invoices do 
        get '/find'             => 'find#show'
        get '/find_all'         => 'find#index'
        get '/random'           => 'random#show'
        get '/random'           => 'random#show'
        get '/:id/transactions' => 'invoice_transactions#show'
        get '/:id/invoice_items'=> 'invoice_invoice_items#show'
        get '/:id/items'        => 'invoice_items#show'
        get '/:id/customer'     => 'invoice_customer#show'
        get '/:id/merchant'     => 'invoice_merchant#show'
      end 
      
      namespace :invoice_items do 
        get '/find'         => 'find#show'
        get '/find_all'     => 'find#index'
        get '/random'       => 'random#show'
        get '/:id/item'     => 'invoice_item_item#show'
        get '/:id/invoice'  => 'invoice_item_invoice#show'
      end 
      
      namespace :transactions do 
        get '/find'         => 'find#show'
        get '/find_all'     => 'find#index'
        get '/random'       => 'random#show'
        get '/:id/invoice'  => 'transaction_invoice#show'
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
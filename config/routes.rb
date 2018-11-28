Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      namespace :merchants do 
        get '/most_revenue' => 'most_revenue#index'
      end 
    end 
  end 
end
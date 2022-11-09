Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  namespace :api do
    namespace :v1 do
      post "/customer_subscriptions", to: "customer_subscriptions#create"
      
      delete "/customer_subscriptions", to: "customer_subscriptions#destroy"

      # get "/customer_subscriptions/:customer_id", to: "customer_subscriptions#index"
    end
  end
end

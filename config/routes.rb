Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 root "products#index"
 resources :products
 resources :sessions, only: [:new, :create]
 delete "/sessions/sign_out", to: "sessions#sign_out"

 resources :orders
end

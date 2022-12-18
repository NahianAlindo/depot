Rails.application.routes.draw do
  resources :orders
  resources :line_items
  resources :carts
  root 'store#index', as: 'store_index' #as: store_index tells rails to create store_index_path and store_index_url accessor and tests to continue working properly
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

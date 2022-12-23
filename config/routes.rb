Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users
  resources :products do
    get :who_bought, on: :member
  end

  resources :support_requests, only: [ :index, :update ]
  scope '(:locale)' do
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store_index', via: :all #as: store_index tells rails to create store_index_path and store_index_url accessor and tests to continue working properly
  end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

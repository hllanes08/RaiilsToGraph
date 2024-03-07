Rails.application.routes.draw do
  devise_for :users
  get 'orders', to: 'orders#index', as: 'orders'
  namespace :api do
    devise_for :users, defaults: { format: :json }, controllers: {
      sessions:  'api/users/sessions', 
    }
    get 'orders', to: 'orders#index', as: 'orders'
    post 'order', to: 'orders#create', as: 'create_order'
   end
  root to: 'home#index' 
end

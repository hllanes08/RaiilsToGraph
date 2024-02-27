Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    devise_for :users, defaults: { format: :json }, controllers: {
      sessions:  'api/users/sessions', 
    }
    get 'orders', to: 'orders#index', as: 'orders'
   end
  root to: 'home#index' 
end

Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    devise_for :users, defaults: { format: :json }, controllers: {
      sessions:  'api/users/sessions', 
    }
   end
  root to: 'home#index' 
end

Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts, except: :index
  devise_for :users
end

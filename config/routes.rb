Rails.application.routes.draw do
  resources :projects
  resources :posts
  devise_for :users
  root "posts#index"
  # root "pages#home"
  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end

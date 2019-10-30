Rails.application.routes.draw do
  root 'memos#index'
  resources :memos

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end

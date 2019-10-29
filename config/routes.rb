Rails.application.routes.draw do
  root 'static_pages#index'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end

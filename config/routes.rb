# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  get '/:shorturl', to: 'home#redirect'
  get '/stats/:shorturl', to: 'stats#index'
  resources :urls
end

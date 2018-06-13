Rails.application.routes.draw do
  root to: 'home#index'
  get '/:shorturl', to: 'home#redirect'

  resources :urls
end

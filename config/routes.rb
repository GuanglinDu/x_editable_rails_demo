Rails.application.routes.draw do
  resources :articles, except: [:edit]
  root 'articles#index'
end

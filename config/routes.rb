Rails.application.routes.draw do
  resources :articles, except: [:new, :edit]
  root 'articles#index'
end

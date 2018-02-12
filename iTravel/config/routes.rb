Rails.application.routes.draw do

  get 'sessions/new'

  resources :users
  resources :static_pages


  root 'static_pages#home'

  get    '/home',    to: 'static_pages#home'
  get    '/my_trips',    to: 'static_pages#my_trips'
  get    '/explore',    to: 'static_pages#explore'

  get    '/signup',    to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'



end

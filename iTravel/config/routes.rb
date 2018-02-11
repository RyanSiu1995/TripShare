Rails.application.routes.draw do

  resources :users
  resources :static_pages


  root 'static_pages#home'

  get    '/home',    to: 'static_pages#home'
  get    '/my_trips',    to: 'static_pages#my_trips'
  get    '/explore',    to: 'static_pages#explore'

  get    '/signup',    to: 'users#new'
  post '/signup',  to: 'users#create'


end

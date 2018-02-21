Rails.application.routes.draw do

  devise_for :users
  resources :users
  resources :trips

  root 'static_pages#home'

  get    '/home',    to: 'static_pages#home'
  get    '/my_trips',    to: 'static_pages#my_trips'
  get    '/explore',    to: 'trips#index'
  get    '/login',    to: 'devise/sessions#create'

end

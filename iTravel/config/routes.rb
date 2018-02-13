Rails.application.routes.draw do

  devise_for :users
  resources :users

  root 'static_pages#home'

  get    '/home',    to: 'static_pages#home'
  get    '/my_trips',    to: 'static_pages#my_trips'
  get    '/explore',    to: 'static_pages#explore'
  get    '/login',    to: 'devise/sessions#create'

end

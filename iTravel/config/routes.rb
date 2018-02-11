Rails.application.routes.draw do

  resources :users

  get 'static_pages/home'
  get 'static_pages/my_trips'
  get 'static_pages/explore'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'


end

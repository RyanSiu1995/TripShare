Rails.application.routes.draw do

  resources :users

  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/my_trips'
  get 'static_pages/explore'

end

Rails.application.routes.draw do
  get 'photos/index'
  
  resources :events
  resources :photo_albums
  resources :photos

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

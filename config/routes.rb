Rails.application.routes.draw do
  get 'photos/index'
  get 'photo_albums/index'
  get 'events/index'
  get 'home/index'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

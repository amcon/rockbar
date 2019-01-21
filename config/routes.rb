Rails.application.routes.draw do

	root 'home#index'

	get 'home/index'
	get 'about/index'
	get 'contact/index'

	resources :admin_users

  resources :events do
  	member do
  		get :delete
  	end
  end

  resources :photo_albums do
  	member do
  		get :delete
  	end
  	resources :photos, except: [:show] do
			member do
				get :delete
			end
		end
  end

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

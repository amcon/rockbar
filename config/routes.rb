Rails.application.routes.draw do

	root 'home#index'

	get 'admin', to: 'admin_users#index'
	get 'about', to: 'about#index'
	get 'contact', to: 'contact#index'
	get 'admin', to: 'access#menu'
	get 'login', to: 'access#login'
  get 'calendar', to: 'events#index'
	post 'access/attempt_login'
	get 'access/logout'
	post 'contact/subscribe', to: 'contact#subscribe'

	resources :admin_users, except: [:show] do
		member do
			get :delete
		end
	end

  resources :events do
  	member do
  		get :delete
  		get :duplicate
  	end
  	resources :home, only: [:index]
  end

  resources :photo_albums do
  	member do
  		get :delete
  	end
  	resources :photos, except: [:index, :show] do
			member do
				get :delete
			end
		end
  end

  resources :staffs do
  	member do
  		get :delete
  	end
  	resources :about, only: [:index]
  end

  resources :descriptions do
  end
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
	root   'static_pages#home'
	get    '/share',   to: 'static_pages#share'
	get    '/information', to: 'static_pages#information'
	get    '/bio',   to: 'static_pages#bio'
	get    '/giving', to: 'static_pages#giving'
	get    '/signup',  to: 'users#new'
	post   '/signup',  to: 'users#create'
	get    '/login',   to: 'sessions#new'
	post   '/login',   to: 'sessions#create'
	delete '/logout',  to: 'sessions#destroy'
	resources :users do
	    member do
	    	get :following, :followers
	    end
	end
	resources :microposts,          only: [:create, :destroy]
	resources :foods,          only: [:create, :destroy]
	resources :relationships,       only: [:create, :destroy]
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
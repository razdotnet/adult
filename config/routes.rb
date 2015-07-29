Rails.application.routes.draw do


  resources :photo_comments
  	resources :categories
	resources :products, only: [:index, :show]
	get 'users/:user_id/wishlist' => 'wishlists#show', as: 'wishlist'
	post 'users/:user_id/create_wishlist' => 'wishlists#create', as: 'create_wishlist'
	post 'users/:user_id/wishlist/add_product' => 'items#create', as: 'add_product'

 
	#=> Base application routes
	resources :charges
	resource :feed, only: [:show]
	resource :people, only: [:show]
	resource :dashboard, only: [:show]
	resource :main, only: [:show]
	resource :explore, only: [:show]
	resource :store, only: [:show]
	resources :locations
	resources :conversations do
		resources :messages
	end
	
	# Authenticated routes

	authenticated :user do 
		root 'feeds#show'
	end

	unauthenticated :user do
		get "/" => "mains#show"
	end

	# => user specified routes 
	
	devise_for :users
	get 'users/:user_id' => 'users#show', as: 'profile'
	get 'users/:user_id/pictures' => 'pictures#index', as: 'picture_all'
	get 'users/:user_id/pictures/:picture_id' => 'pictures#show', as: 'user_picture'
	post 'users/:user_id/pictures/new' => 'pictures#create', as: 'new_picture'
	get 'users/:user_id/posts/:id' => 'posts#show', as: 'user_post'
	post 'posts/new' => 'posts#create', as: 'post'
	post '/users/:user_id/friend' => 'friendables#create', as: 'friend'
	get '/account' => 'users#edit', as: 'edit_account'
	patch '/account/process' => 'users#update', as: 'update_account'

	# Housekeeping routes 

	namespace :housekeeping do
		get '' => 'dashboard#show'
		resources :users
		resources :products
		resources :wishlists
		resources :categories
	end
	
end
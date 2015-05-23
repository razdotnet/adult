Rails.application.routes.draw do
	resources :feed, only: [:show]
	resources :people
	resource :dashboard, only: [:show]
	resource :main, only: [:show]
	resource :explore, only: [:show]
	resources :locations
	devise_for :users

	authenticated :user do 
		root 'feeds#show'
	end



	unauthenticated :user do
		get "/" => "mains#show"
	end

	get "/explore" => "explores#show"

	resources :users do
		get 'users/:id' => 'users#show', as: 'profile'
		post 'friend_request'
    	post 'friend_request_accept'
    	delete 'friend_request_reject'
	end
end
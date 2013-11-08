HnRails::Application.routes.draw do
	
	devise_for :users
	root :to => "posts#index"

	resources :posts

	resources :comments

	resources :posts do 
		resources :comments 
	end 
	
end

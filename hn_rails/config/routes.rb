HnRails::Application.routes.draw do
	
	resources :comments
	devise_for :users
	root :to => "posts#index"

	resources :posts
	

	resources :posts do 
		resources :comments 
	end 
	
end

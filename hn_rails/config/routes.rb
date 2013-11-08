HnRails::Application.routes.draw do
	
	devise_for :users
	root :to => "posts#index"

  post "up_vote" => "posts#upvote", as: "upvote"

	resources :posts do 
		resources :comments 
	end 
	
end

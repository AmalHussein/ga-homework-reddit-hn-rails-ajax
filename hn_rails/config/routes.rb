HnRails::Application.routes.draw do
	
	devise_for :users
	root :to => "posts#index"

  post "up_votes" => "posts#up_votes", as: "up_votes"

  post "down_votes" => "posts#down_votes", as: "down_votes"

	resources :posts do 
		resources :comments 
	end 
	
end

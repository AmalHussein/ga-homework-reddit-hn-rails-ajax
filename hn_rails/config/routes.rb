HnRails::Application.routes.draw do
 
  devise_for :users
 root :to => "post#index"

 resource :posts
 
end

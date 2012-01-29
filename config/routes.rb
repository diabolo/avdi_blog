AvdiBlog::Application.routes.draw do

  resources :posts, :only => [:new, :create]
  root :to => 'blog#index'
end
